(* Copyright (c) 2016-2017 David Kaloper Meršinjak. All rights reserved. See
   LICENSE.md. *)

(** [Notty] IO for pure [Unix].

    This is an IO module for {!Notty}.

    {e %%VERSION%% — {{:%%PKG_HOMEPAGE%%} homepage}} *)

open Notty

(** {1:fullscreen Fullscreen input and output}. *)

(** Terminal IO abstraction for fullscreen, interactive applications.

    This module provides both input and output. It assumes exclusive ownership of
    the IO streams between {{!create} initialization} and {{!release} shutdown}. *)
module Term : sig
  (** Representation of the terminal, giving structured access to IO. *)
  type t

  (** {1 Construction and destruction} *)

  (** [create ~dispose ~nosig ~mouse ~input ~output ()] creates a fresh
      {{!t} terminal}. It has the following side effects:
      - [Unix.tcsetattr] is applied to [input] to disable {e echo} and
        {e canonical mode}.
      - [output] is set to {e alternate screen mode}, and the cursor is
        hidden. Mouse and {e bracketed paste} reporting are (optionally)
        enabled.
      - [SIGWINCH] signal, normally ignored, is handled.

      [~dispose] arranges for automatic {{!release} cleanup} of the terminal
      before the process terminates. The downside is that a reference to this
      terminal is retained until the program exits. Defaults to [true].

      [~nosig] additionally turns off signal delivery and flow control
      ({e isig} and {e ixon}) on input. Inhibits automatic handling of
      {e CTRL-\{C,Z,\,S,Q\}}. Defaults to [true].

      [~mouse] activates mouse reporting. Defaults to [true].

      [~bpaste] activates bracketed paste reporting. Defaults to [true].

      [~input] is the input file descriptor. Defaults to [stdin].

      [~output] is the output file descriptor. Defaults to [stdout]. *)
  val create
    :  ?dispose:bool
    -> ?nosig:bool
    -> ?mouse:bool
    -> ?bpaste:bool
    -> ?input:Unix.file_descr
    -> ?output:Unix.file_descr
    -> unit
    -> t

  (** Dispose of this terminal. Original behavior of input fd is reinstated,
      cursor is restored, mouse reporting disabled, and alternate mode is
      terminated.

      It is an error to use the {{!cmds} commands} on a released terminal, and
      will raise [Invalid_argument], while [release] itself is idempotent. *)
  val release : t -> unit

  (** {1:cmds Commands} *)

  (** [image t i] sets [i] as [t]'s current image and redraws the terminal. *)
  val image : t -> image -> unit

  (** [refresh t] redraws the terminal using the current image.

      Useful if the output might have become garbled. *)
  val refresh : t -> unit

  (** [cursor t pos] sets and redraws the cursor.

      [None] hides it. [Some (x, y)] places it at column [x] and row [y], with
      the origin at [(0, 0)], mapping to the upper-left corner. *)
  val cursor : t -> (int * int) option -> unit

  (** {1 Events} *)

  (** Wait for a new event. [event t] can be:
      - [#Unescape.event], an {{!Notty.Unescape.event} [event]} from the input fd;
      - [`End] if the input fd is closed, or the terminal was released; or
      - [`Resize (cols, rows)] giving the current size of the output tty, if a
        [SIGWINCH] was delivered before or during this call to [event].

      {b Note} [event] is buffered. Calls can either block or immediately
      return. Use {{!pending} [pending]} to detect when the next call would not
      block. *)
  val event : t -> [ Unescape.event | `Resize of int * int | `End ]

  (** [pending t] is [true] if the next call to {{!event} [event]} would not
      block and the terminal has not yet been released. *)
  val pending : t -> bool

  (** {1 Properties} *)

  (** [size t] is the current size of the terminal's output tty. *)
  val size : t -> int * int

  (** [fds t] are [t]'s input and output file descriptors. *)
  val fds : t -> Unix.file_descr * Unix.file_descr

  (** {1 Window size change notifications} *)

  (** Manual [SIGWINCH] handling.

      Unix delivers notifications about tty size changes through the [SIGWINCH]
      signal. A handler for this signal is installed as soon as a new terminal
      is {{!create} created}. Replacing the global [SIGWINCH] handler using
      the [Sys] module will cause this module to malfunction, as the size change
      notifications will no longer be delivered.

      You might still want to ignore resizes reported by {{!event} [event]} and
      directly listen to [SIGWINCH]. This module allows installing such
      listeners without conflicting with the rest of the machinery. *)
  module Winch : sig
    (** [add fd f] registers a [SIGWINCH] handler. Every time the signal is
        delivered, [f] is called with the current size of the tty backing [fd].
        If [fd] is not a tty, [f] is never called.

        Return value is a function that removes the handler [f].

        Handlers are called in an unspecified order. *)
    val add
      :  Unix.file_descr
      -> (int * int -> unit)
      -> [ `Revert of unit -> unit ]
  end
end

(** {1:inline Inline output}

    These operations do not assume exclusive access to the output. This means
    that they can be combined with other means of producing output. At the same
    time, it means that they are affected by the current terminal state, and
    that this state is not tracked. *)

(** [winsize fd] is [Some (columns, rows)], the current dimensions of [fd]'s
    backing tty, or [None], when [fd] is not backed by a tty. *)
val winsize : Unix.file_descr -> (int * int) option

(** [eol image] is [image], producing an extra newline when printed. *)
val eol : image -> image

(** [output_image ?cap ?fd image] writes [image] to [fd].

    The image is displayed in its full height. If the output is a tty, image
    width is clipped to the output width. Otherwise, full width is used.

    [~cap] is the {{!caps} optional} terminal capability set.

    [~fd] defaults to [stdout]. *)
val output_image : ?cap:Cap.t -> ?fd:out_channel -> image -> unit

(** [output_image_size ?cap ?fd f] is
    [output_image ?cap ?fd (f size)] where [size] are [fd]'s current
    {{!winsize} output dimensions}.

    If [fd] is not backed by a tty, as a matter of convenience, [f] is applied
    to [(80, 24)]. Use {!Unix.isatty} or {{!winsize} [winsize]} to detect whether
    the output has a well-defined size. *)
val output_image_size
  :  ?cap:Cap.t
  -> ?fd:out_channel
  -> (int * int -> image)
  -> unit

(** [show_cursor ?cap ?fd visible] toggles the cursor visibility on [fd]. *)
val show_cursor : ?cap:Cap.t -> ?fd:out_channel -> bool -> unit

(** [move_cursor ?cap ?fd motion] moves the cursor on [fd].

    [motion] is one of:
    {ul
     {- [`To (column, line)], positioning the cursor to [(column, line)]. Origin
       is [(0, 0)], the upper-left corner of the screen.
    }
     {- [`Home], moving the cursor the beginning of line. }
     {- [`By (columns, lines)], moving the cursor [columns] to the right (left if
       negative) and [lines] down (up if negative).

       {b Note} Behavior is terminal dependent if the movement overshoots the
       output size.
    }
    } *)
val move_cursor
  :  ?cap:Cap.t
  -> ?fd:out_channel
  -> [ `Home | `By of int * int | `To of int * int ]
  -> unit

(** {1:caps Capability detection}

    All [image] output requires {{!Notty.Cap.t} terminal capabilities}.

    When not provided, capabilities are auto-detected, by checking that the
    output is a tty, that the environment variable [$TERM] is set, and that it
    is not set to either [""] or ["dumb"]. If these conditions hold,
    {{!Notty.Cap.ansi} ANSI} escapes are used. Otherwise, {{!Notty.Cap.dumb} no}
    escapes are used. *)

(**/**)

(** {1 Private}

    These are private interfaces, prone to breakage. Don't use them. *)
module Private : sig
  val cap_for_fd : Unix.file_descr -> Cap.t

  val setup_tcattr
    :  nosig:bool
    -> Unix.file_descr
    -> [ `Revert of unit -> unit ]

  val set_winch_handler : (unit -> unit) -> [ `Revert of unit -> unit ]

  module Gen_output (O : sig
      type fd
      type k

      val def : fd
      val to_fd : fd -> Unix.file_descr
      val write : fd -> Buffer.t -> k
    end) : sig
    val output_image : ?cap:Cap.t -> ?fd:O.fd -> image -> O.k

    val output_image_size
      :  ?cap:Cap.t
      -> ?fd:O.fd
      -> (int * int -> image)
      -> O.k

    val show_cursor : ?cap:Cap.t -> ?fd:O.fd -> bool -> O.k

    val move_cursor
      :  ?cap:Cap.t
      -> ?fd:O.fd
      -> [ `Home | `By of int * int | `To of int * int ]
      -> O.k

    val eol : image -> image
  end
end

(**/**)
