all: arith

test: arith test.txt
	./arith test.txt

arith: parser.cmo lexer.cmo eval.cmo main.cmo
	ocamlc -o arith $^

main.cmo: main.ml eval.cmi
	ocamlc -c $<

eval.cmi: eval.mli
	ocamlc -c $^

eval.cmo: eval.ml eval.cmi
	ocamlc -c $<

parser.cmo: parser.ml parser.cmi
	ocamlc -c $<

parser.cmi: parser.mli ast.cmi
	ocamlc -c $<

ast.cmi: ast.mli
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
