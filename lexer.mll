{
open Parser
}

let digit = [ '0' - '9' ]

rule token = parse
  | [ ' ' '\t' ] { token lexbuf              }
  | '\n'         { NEWLINE                   }
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
  | _            { token lexbuf              }
  | eof          { EOF                       }
