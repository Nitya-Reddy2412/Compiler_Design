%{
#include "Topdown.tab.h"
#include <stdio.h>
#include <string.h>
#include <ctype.h>

void yyerror(const char *s);
%}

%%
[a-zA-Z_][a-zA-Z0-9_]*   { return ID; }    // ✅ variable names like a, x1, var_2
"+"                      { return PLUS; }
"*"                      { return STAR; }
"("                      { return LPAREN; }
")"                      { return RPAREN; }
[ \t\r]+                 ;                 // ignore spaces/tabs
\n                       { return '\n'; }  // newline = end of expression
.                        { yyerror("Invalid character"); }
%%
int yywrap(void) { return 1; }
