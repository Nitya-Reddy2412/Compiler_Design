%{
    #include<stdio.h>
%}

keywords auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|int|long|register|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while

%%

{keywords}    { printf("%s is a C keyword.\n", yytext); }
[^\n]+ { printf("%s is not a C keyword.\n", yytext); }

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