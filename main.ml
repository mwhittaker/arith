let main () =
  if Array.length Sys.argv < 2 then (
    print_endline "usage: arith <filename>";
    exit 0
  ) else ();
  
  let filename = Sys.argv.(1) in 
  try
    let lexbuf = Lexing.from_channel (open_in filename) in
    Parser.input Lexer.token lexbuf
  with 
    | End_of_file -> exit 0

let _ = Printexc.print main ()
