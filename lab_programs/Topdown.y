%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s);
%}

%token ID PLUS STAR LPAREN RPAREN

%%
input:
      /* empty */
    | input line
    ;

line:
      E '\n'     { printf("Valid expression\n"); }
    ;

E:
      T E_PRIME
    ;

E_PRIME:
      PLUS T E_PRIME
    | /* ε */
    ;

T:
      F T_PRIME
    ;

T_PRIME:
      STAR F T_PRIME
    | /* ε */
    ;

F:
      LPAREN E RPAREN
    | ID
    ;
%%

int main(void) {
    printf("Enter expressions (Ctrl+C to exit):\n");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Invalid expression\n");
}
