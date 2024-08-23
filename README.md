# Capymanga

**Capymanga** is a terminal UI for [Mangadex](https://mangadex.org/) written in
[OCaml](https://ocaml.org/). It uses
[kitty](https://sw.kovidgoyal.net/kitty/) to show images in your terminal.

Capymanga is currently under construction and is missing many features!

## Installation (build from source)

I'd like to eventually make installing Capymanga really easy. While Capymanga is
being built, you can use it by building from source. If these instructions do
not work, please feel free to let me know by filing an issue!

1. If you haven't already, **install [kitty](https://sw.kovidgoyal.net/kitty/)**.
   Kitty is a terminal emulator that lets Capymanga show images from the
   terminal. I would like to implement first-class support for other terminal
   emulators at some point in the future, though sadly Capymanga currently can
   only display images with kitty...

2. If you are new to OCaml - _or if you haven't already_ - **install
   [opam](https://opam.ocaml.org/)**. It is OCaml's package manager and we'll
   be using it to install Capymanga's OCaml dependencies. The specific
   install instructions depend on your platform; you can find platform-specific
   instructions [here](https://opam.ocaml.org/doc/Install.html).

3. Create a new _"opam switch"_. You can think of a switch as kind of like a
   "python environment". A more detailed explanation of "switches" is
   [here](https://ocaml.org/docs/opam-switch-introduction). I've developed
   capymanga on OCaml 5.1.0, so we'll be creating switch for OCaml 5.1.0.

```sh
opam switch create 5.1.0
```

4. Clone this repo, and go inside of it with `cd`:

```sh
git clone https://github.com/Enoumy/capy
cd capy
```

5. Install capymanga's dependencies:

```sh
opam install . --deps-only --with-test
```

6. Build capymanga with [dune](https://dune.build/). `dune` is OCaml's "build
   system". We'll use dune to turn our source code into an executable we can
   run. It _should_ have been installed in the previous step for you. You can use
   `dune` to build capymanga with:

```sh
dune build
```

7. Assuming that the above step succeeded, `dune` will place the things it
   builds inside of a `_build/default` directory. You should be able to run
   capymanga with:

```sh
./_build/default/app/capymanga/bin/main.exe
```
