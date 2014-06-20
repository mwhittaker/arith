/* parser.mly */

%{
open Printf
%}

%token <float> NUM

%token PLUS      /* a + b */
%token MINUS     /* a - b */
%token MULTIPLY  /* a * b */
%token DIVIDE    /* a / b */
%token CARET     /* a ^ b */
%token UMINUS    /* -a    */

%token LPAREN    /* (     */
%token RPAREN    /* )     */

%token NEWLINE   /* \n    */
%token EOF       /* ^d    */
%token SEMICOLON /* ;     */

%left PLUS MINUS
%left MULTIPLY DIVIDE
%left UMINUS
%right CARET

%start input
%type <Ast.program> input

%start stdin
%type <unit> stdin

%start expr
%type <Ast.expression> expr

%%

input:   EOF                  { [] }
       | expr SEMICOLON input { $1::$3 }
;

stdin:   EOF            { () }
       | expr SEMICOLON { Printf.printf "%f\n" (Eval.eval_expr $1);
                          flush stdout;
                          Globals.indent := false }
;

expr:    NUM                 { Ast.Num      ($1    ) }
       | expr PLUS     expr  { Ast.Plus     ($1, $3) }
       | expr MINUS    expr  { Ast.Minus    ($1, $3) }
       | expr MULTIPLY expr  { Ast.Multiply ($1, $3) }
       | expr DIVIDE   expr  { Ast.Divide   ($1, $3) }
       | expr CARET    expr  { Ast.Caret    ($1, $3) }
       | UMINUS expr         { Ast.Uminus   ($2    ) }
       | LPAREN expr RPAREN  { $2                    }
;

%% 
