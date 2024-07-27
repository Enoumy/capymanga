open! Core
open Bonsai

module For_dimensions = struct
  type t =
    { var : Dimensions.t Bonsai.Var.t
    ; term : Term.t
    }

  let create ~term =
    let var = Bonsai.Var.create (Term.dimensions term) in
    { var; term }
  ;;

  let set { var; term = _ } dimensions = Bonsai.Var.set var dimensions

  let update ({ term; var } as t) =
    let new_dimensions = Term.dimensions term in
    if not ([%equal: Dimensions.t] (Var.get var) new_dimensions)
    then set t new_dimensions
  ;;

  let register { term = _; var } computation =
    Bonsai.Dynamic_scope.set
      Dimensions.Private.variable
      (Bonsai.Var.value var)
      ~inside:computation
  ;;
end

module For_clock = struct
  type t = Bonsai.Time_source.t

  let create () = Bonsai.Time_source.create ~start:(Time_ns.now ())

  let advance_to clock to_ =
    Bonsai.Time_source.advance_clock clock ~to_;
    Bonsai.Time_source.Private.flush clock
  ;;
end
