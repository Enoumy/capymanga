open! Core
open Capytui

let lerp v0 v1 t =
  let t = Percent.to_mult t in
  v0 +. (t *. (v1 -. v0))
;;

let render
  ~center
  ~scale
  ~max_iterations
  ~dimensions:({ width; height } : Dimensions.t)
  =
  let center =
    { Complex.real = center.Complex.real -. 0.765
    ; imaginary = center.imaginary
    }
  in
  let left = center.real -. (1.235 *. Percent.to_mult scale)
  and right = center.real +. (1.235 *. Percent.to_mult scale)
  and top = center.imaginary -. (1.12 *. Percent.to_mult scale)
  and bottom = center.imaginary +. (1.12 *. Percent.to_mult scale) in
  Array.init height ~f:(fun y ->
    let y = Int.to_float y
    and height = Int.to_float height in
    Array.init width ~f:(fun x ->
      let x = Int.to_float x
      and width = Int.to_float width in
      let x0 = lerp left right (Percent.of_mult (x /. width))
      and y0 = lerp top bottom (Percent.of_mult (y /. height)) in
      let x = ref 0.0
      and y = ref 0.0
      and iteration = ref 0 in
      let ( <= ) = Float.( <= ) in
      while
        (!x *. !x) +. (!y *. !y) <= 2.0 *. 2.0 && !iteration < max_iterations
      do
        let xtemp = (!x *. !x) -. (!y *. !y) +. x0 in
        y := (2.0 *. !x *. !y) +. y0;
        x := xtemp;
        incr iteration
      done;
      !iteration))
;;
