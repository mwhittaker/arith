(** If [indent] is true, then the repl prints an indentation. Otherwise, it
    does not. This is a pretty printing implementation detail. *)
let indent = ref true

(** [repl] is true if we're in a repl. Again, a hacky implementation detail. *)
let repl = ref false
