%{
#include <stdio.h>
%}

init   [a-zA-Z_]
name   [a-zA-Z0-9_]*
comment   (\/\/[^\n]*)|(\/\*([^*]|\*+[^*/])*\*\/)
function (void|int|float|char|double|long|struct)

%%
{function}[ \t]+{init}{name}*\([^\)]*\)[ \t]*\{[^}]*\} { printf("%s is a function.\n", yytext); }
{comment} { printf("%s is a comment.\n", yytext); }
.|\n { /* Ignore other characters */ }
%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    return 0;
}