%{
    #include<stdio.h>
%}

arith     (\+|\-|\*|\/|%)
relat     (<|!=|==|>|<=|>=)
logic     (&&|\|\||!)
bitwise   (&|\||\^|~)
assign    (=|\+=|\-=|\*=|\/=|%=)

%%
{arith}     {printf("%s is an arithmetic operator.\n", yytext);}
{relat}     {printf("%s is a relational operator.\n", yytext);}
{logic}     {printf("%s is a logical operator.\n", yytext);}
{bitwise}   {printf("%s is a bitwise operator.\n", yytext);}
{assign}    {printf("%s is an assignment operator.\n", yytext);}
[^\n]+      {printf("%s is not a valid operator.\n", yytext);}
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