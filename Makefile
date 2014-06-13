

all: arith

arith: parser.cmo lexer.cmo main.cmo
	ocamlc -o arith $^

main.cmo: main.ml
	ocamlc -c $^

parser.cmo: parser.ml parser.cmi
	ocamlc -c $<

parser.cmi: parser.mli
	ocamlc -c $^

parser.ml parser.mli: parser.mly
	ocamlyacc $^

lexer.cmo: lexer.ml
	ocamlc -c $^

lexer.ml: lexer.mll
	ocamllex $^

clean:
	-rm -f *.cmi
	-rm -f *.cmo
	-rm -f parser.ml
	-rm -f parser.mli
	-rm -f lexer.ml
	-rm -f arith
