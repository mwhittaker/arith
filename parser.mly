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

%token LPAREN   /* (     */
%token RPAREN   /* )     */

%token NEWLINE  /* \n    */
%token EOF      /* ^d    */

%left PLUS MINUS
%left MULTIPLY DIVIDE
%left UMINUS
%right CARET

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

exp:     NUM               { Ast.Num      ($1    ) }
       | exp PLUS     exp  { Ast.Plus     ($1, $3) }
       | exp MINUS    exp  { Ast.Minus    ($1, $3) }
       | exp MULTIPLY exp  { Ast.Multiply ($1, $3) }
       | exp DIVIDE   exp  { Ast.Divide   ($1, $3) }
       | exp CARET    exp  { Ast.Caret    ($1, $3) }
       | UMINUS exp        { Ast.Uminus   ($2    ) }
       | LPAREN exp RPAREN { $2                    }
;

%% 
