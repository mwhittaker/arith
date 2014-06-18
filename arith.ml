let eval_file (filename: string) : unit = 
  let lexbuf  = Lexing.from_channel (open_in filename) in
  let program = Parser.input Lexer.token lexbuf in
  List.iter (Printf.printf "%f\n") (Eval.eval program)

let main () =
  match Array.to_list Sys.argv with
    | [] | [_] -> begin
      print_endline "usage: arith <filename>";
      exit 0
    end
    | _::filenames -> List.iter eval_file filenames

let _ = Printexc.print main ()
