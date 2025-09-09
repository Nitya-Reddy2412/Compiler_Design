%{
    #include<stdio.h>
%}

operator   (\+|\-|\*|\/|%|<|=|!=|==|>|<=|>=|&&|\|\||!|&|\||\^|~|=|\+=|\-=|\*=|\/=|%=)
identifier [a-zA-Z_][a-zA-Z0-9_]*
constant   ([0-9]+(\.[0-9]*)?|\.[0-9]+)
comment    (\/\/[^\n]*|\/\*([^*]|\*+[^*/])*\*+\/)

%%
{constant}     {printf("%s is a constant.\n", yytext);}
{comment}      {printf("%s is a comment.\n", yytext);}
{identifier}   {printf("%s is an identifier.\n", yytext);}
{operator}     {printf("%s is an operator.\n", yytext);}
[ \t\n]+       { /* ignore whitespace */ }
.              {printf("%s is not a recognized pattern.\n", yytext);}
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