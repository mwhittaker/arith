let rec repl () =
  let lexbuf = Lexing.from_string (read_line ()) in
  let expr = Parser.exp Lexer.token lexbuf in
  Printf.printf "%f\n" (Eval.eval_expr expr);
  repl ()
