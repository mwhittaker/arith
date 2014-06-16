(** Module eval contains the functions to evaluate arith expressions and
    programs. *)

(** [eval_expr] evaluates a single arith expression. Provably, all arith
    expressions evaluate to floats. *)
val eval_expr : Ast.expression -> float

(** [eval] evaluates an entire arith program. *)
val eval      : Ast.program    -> float list
