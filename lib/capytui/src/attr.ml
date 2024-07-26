open! Core

type t = Notty.A.t

let many attrs = List.fold attrs ~init:Notty.A.empty ~f:Notty.A.( ++ )
let bold = Notty.A.st Notty.A.bold
let italic = Notty.A.st Notty.A.italic
let underline = Notty.A.st Notty.A.underline
let blink = Notty.A.st Notty.A.blink
let reverse = Notty.A.st Notty.A.reverse

module Color = struct
  type t = Notty.A.color

  let black = Notty.A.black
  let red = Notty.A.red
  let green = Notty.A.green
  let yellow = Notty.A.yellow
  let blue = Notty.A.blue
  let magenta = Notty.A.magenta
  let cyan = Notty.A.cyan
  let white = Notty.A.white
  let lightblack = Notty.A.lightblack
  let lightred = Notty.A.lightred
  let lightgreen = Notty.A.lightgreen
  let lightyellow = Notty.A.lightyellow
  let lightblue = Notty.A.lightblue
  let lightmagenta = Notty.A.lightmagenta
  let lightcyan = Notty.A.lightcyan
  let lightwhite = Notty.A.lightwhite
  let rgb = Notty.A.rgb_888
end

let foreground_color = Notty.A.fg
let background_color = Notty.A.bg
