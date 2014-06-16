(** Module Ast contains type definitions for arith's abstract syntax tree. *)

(** Each arith expression, or term, represents a basic mathematical expression
    that evaluates to a float. *)
type expression = 
  | Num      of float                   (** a, b  *)
  | Plus     of expression * expression (** a + b *)
  | Minus    of expression * expression (** a - b *)
  | Multiply of expression * expression (** a * b *)
  | Divide   of expression * expression (** a / b *)
  | Caret    of expression * expression (** a ^ b *)
  | Uminus   of expression              (** ~a    *)

(** An arith program is composed of a list of expressions. Each expression is
    evaluated to a float and printed. *)
type program = expression list
