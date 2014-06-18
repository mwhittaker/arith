/* parser.mly */

%{
open Printf
%}

%token <float> NUM

%token PLUS     /* a + b */
%token MINUS    /* a - b */
%token MULTIPLY /* a * b */
%token DIVIDE   /* a / b */
%token CARET    /* a ^ b */
%token UMINUS   /* -a    */

%token NEWLINE
%token EOF

%start input
%type <Ast.program> input

%start exp
%type <Ast.expression> exp

%%

input:   EOF              { [] }
       | line input       { match $1 with None -> $2 | Some e -> e::$2 }
;

line:    NEWLINE          { None }
       | exp NEWLINE      { Some $1 }
;

exp:     NUM              { Ast.Num      ($1    ) }
       | exp exp PLUS     { Ast.Plus     ($1, $2) }
       | exp exp MINUS    { Ast.Minus    ($1, $2) }
       | exp exp MULTIPLY { Ast.Multiply ($1, $2) }
       | exp exp DIVIDE   { Ast.Divide   ($1, $2) }
       | exp exp CARET    { Ast.Caret    ($1, $2) }
       | exp UMINUS       { Ast.Uminus   ($1    ) }
;

%% 
