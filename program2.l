%{
    #include<stdio.h>
%}

digits [0-9]

%%
(\+|\-)?(({digits}+(\.{digits}*)?)|(\.{digits}+)) {printf("%s is a real number.\n", yytext); }
[^\n]+ {printf("%s is not a real number.\n", yytext); }
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