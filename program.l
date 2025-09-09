%{
#include<stdio.h>
%}

letters [a-zA-Z_]
digits [0-9]

%%
{letters}({letters}|{digits})* { printf("%s is an identifier.\n", yytext); }
[^\n]+ { printf("%s is not an identifier.\n", yytext); }
%%

int yywrap()
{
    return 1;
}

int main()
{
    yylex();
    return 0;
}