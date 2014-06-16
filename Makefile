DEPENDS = $(wildcard *.ml)  \
		  $(wildcard *.mli) \
		  $(wildcard *.mll) \
		  $(wildcard *.mly)
ODOCL         = doc
TEST_FILENAME = test.txt
ARITH         = arith.byte

.PHONY: all arith doc test clean

all: $(ARITH)
arith: $(ARITH)
doc: $(ODOCL).docdir/index.html

test: arith
	./$(ARITH) $(TEST_FILENAME)

$(ARITH): $(DEPENDS)
	ocamlbuild $@

$(ODOCL).docdir/index.html: $(DEPENDS)
	ocamlbuild $@

clean:
	ocamlbuild -clean
