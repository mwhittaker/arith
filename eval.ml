open Ast

let rec eval_expr = function
  | Num      (n           ) -> n
  | Plus     (expr1, expr2) -> (eval_expr expr1) +. (eval_expr expr2)
  | Minus    (expr1, expr2) -> (eval_expr expr1) -. (eval_expr expr2)
  | Multiply (expr1, expr2) -> (eval_expr expr1) *. (eval_expr expr2)
  | Divide   (expr1, expr2) -> (eval_expr expr1) /. (eval_expr expr2)
  | Caret    (expr1, expr2) -> (eval_expr expr1) ** (eval_expr expr2)
  | Uminus   (expr        ) ->                  ~-. (eval_expr expr )

let eval = List.map eval_expr
