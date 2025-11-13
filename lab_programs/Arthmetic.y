%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%union {
    int ival;
}

%token <ival> DIGIT
%type  <ival> expr term factor

%%
input:
      /* empty */
    | input line
    ;

line:
      expr '\n'   { printf("Result = %d\n", $1); }
    ;

expr:
      expr '+' term   { $$ = $1 + $3; }
    | expr '-' term   { $$ = $1 - $3; }
    | term            { $$ = $1; }
    ;

term:
      term '*' factor { $$ = $1 * $3; }
    | term '/' factor { $$ = $1 / $3; }
    | factor          { $$ = $1; }
    ;

factor:
      '(' expr ')'    { $$ = $2; }
    | DIGIT           { $$ = $1; }
    ;
%%

int main(void) {
    printf("Enter an arithmetic expression (e.g., 3+5*2):\n");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
