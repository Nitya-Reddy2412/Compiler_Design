%{
#include "y.tab.h"
#include <ctype.h>
#include <stdlib.h>
%}

%%
[0-9]+      { yylval = atoi(yytext); return DIGIT; }
[ \t]       ;   // ignore spaces and tabs
\n          { return '\n'; }
.           { return yytext[0]; }
%%
int yywrap(void) { return 1; }
