%{
#include "y.tab.h"
#include <stdlib.h>
%}

%%
[0-9]+      { yylval.ival = atoi(yytext); return DIGIT; }
[ \t]       ;           // Ignore spaces and tabs
\n          { return '\n'; }   // Send newline to Yacc
.           { return yytext[0]; }
%%
int yywrap(void) { return 1; }
