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

%start input
%type <unit> input

%%

input:   /* empty */      { }
       | line input       { }
;

line:    NEWLINE          { }
       | exp NEWLINE      { printf "%.4g\n" $1; flush stdout }
;

exp:     NUM              { $1       }
       | exp exp PLUS     { $1 +. $2 }
       | exp exp MINUS    { $1 -. $2 }
       | exp exp MULTIPLY { $1 *. $2 }
       | exp exp DIVIDE   { $1 /. $2 }
       | exp exp CARET    { $1 ** $2 }
       | exp exp UMINUS   { -. $1    }
;

%% 
