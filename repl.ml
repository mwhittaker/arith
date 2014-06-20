let repl () =
  let lexbuf = Lexing.from_channel stdin in
  let rec repl' () =
    print_string "λ "; flush stdout;
    Parser.stdin Lexer.token lexbuf;
    repl' ()
  in repl' ()
