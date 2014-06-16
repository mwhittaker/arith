CMOS    = eval.cmo parser.cmo lexer.cmo main.cmo 
CMIS    = ast.cmi eval.cmi parser.cmi
DEPENDS = lexer.ml parser.mli parser.ml
OUT     = arith

all: $(OUT)

$(OUT): $(DEPENDS) $(CMIS) $(CMOS)
	ocamlc -o $(OUT) $(CMOS)

test: $(OUT) test.txt
	./$(OUT) test.txt

clean: 
	rm -f *.cmo
	rm -f *.cmi
	rm -f $(DEPENDS)

purge: clean 
	rm -f $(OUT)

%.cmo: %.ml
	ocamlc -c $<

%.cmi: %.mli
	ocamlc -c $<

%.ml: %.mll
	ocamllex $<

%.mli %.ml: %.mly
	ocamlyacc $<

.PHONY: all test clean purge
