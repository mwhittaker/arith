{
open Parser
open Globals
}

let digit = [ '0' - '9' ]

rule token = parse
  | [ ' ' '\t' ] { token lexbuf }
  | '\n'         { if !indent then (
                     if !repl then (
                       print_string "  "; 
                       flush stdout
                     )
                   ) else
                     indent := true
                   ; 
                   token lexbuf }
  | digit+                        (* 1   *)
  | "." + digit+                  (*  .1 *)
  | digit+ + "." + digit+ as num  (* 1.1 *)
                 { NUM (float_of_string num) }
  | '+'          { PLUS                      }
  | '-'          { MINUS                     }
  | '*'          { MULTIPLY                  }
  | '/'          { DIVIDE                    }
  | '^'          { CARET                     }
  | '~'          { UMINUS                    }
  | '('          { LPAREN                    }
  | ')'          { RPAREN                    }
  | ';'          { SEMICOLON                 }
  | _            { token lexbuf              }
  | eof          { EOF                       }
