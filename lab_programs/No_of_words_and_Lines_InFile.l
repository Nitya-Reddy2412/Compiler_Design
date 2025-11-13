
%{
#include <stdio.h>

int words = 0, lines = 0;
%}

%%
[ \t\n]+           { words++; if(yytext[0] == '\n') lines++; }
.                  ;
%%

int yywrap() {
    return 1;
}

int main() {
    yylex();
    printf("Number of lines: %d\n", lines);
    printf("Number of words: %d\n", words);
    return 0;
}
