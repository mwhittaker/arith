type expression = 
  | Num      of float
  | Plus     of expression * expression
  | Minus    of expression * expression
  | Multiply of expression * expression
  | Divide   of expression * expression
  | Caret    of expression * expression
  | Uminus   of expression

type program = expression list
