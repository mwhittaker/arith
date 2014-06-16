let main () =
  if Array.length Sys.argv < 2 then (
    print_endline "usage: arith <filename>";
    exit 0
  ) else ();
  
  let filename = Sys.argv.(1) in 
  let lexbuf = Lexing.from_channel (open_in filename) in
  let program = Parser.input Lexer.token lexbuf in
  List.iter (fun f -> print_float f; print_endline "") (Eval.eval program)

let _ = Printexc.print main ()
