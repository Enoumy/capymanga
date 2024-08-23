install:
	opam install . --deps-only --with-test
build:
	dune build
run:
	dune exec ./app/capymanga/bin/main.exe
