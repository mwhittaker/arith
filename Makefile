DEPENDS = $(wildcard *.ml)  \
		  $(wildcard *.mli) \
		  $(wildcard *.mll) \
		  $(wildcard *.mly)
ODOCL = doc
TEST  = test.byte
ARITH = arith.byte

.PHONY: all arith doc test clean

all: $(ARITH)
arith: $(ARITH)
doc: $(ODOCL).docdir/index.html
test: $(TEST)

$(TEST): test.ml
	ocamlbuild -use-ocamlfind -pkgs oUnit $(TEST)

$(ARITH): $(DEPENDS)
	ocamlbuild $@

$(ODOCL).docdir/index.html: $(DEPENDS)
	ocamlbuild $@

clean:
	ocamlbuild -clean
