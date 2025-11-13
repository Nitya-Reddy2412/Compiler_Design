%{
#include <stdio.h>
#include <stdlib.h>

// Function declarations
int yylex(void);
void yyerror(const char *s);
%}

%token DIGIT

%%
input:
      /* empty */
    | input line
    ;

line:
      expr '\n'     { printf("Result = %d\n", $1); }
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
    printf("Enter arithmetic expressions (Ctrl+C to exit):\n");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
