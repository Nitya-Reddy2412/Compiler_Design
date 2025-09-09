%{
#include<stdio.h>
%}

vowels [aeiouAEIOU]
consonants [bcdfghjklmnpqrstvwxyzBCDFGHIJKLMNPQRSTVWXYZ]

%%
{vowels} {printf("%s is a vowel.\n",yytext);}
{consonants} {printf("%s is a consonant.\n",yytext);}
[ \t\n]+ {}
. {printf("%s is neither a consonant nor a vowel.\n",yytext);}
%%

int yywrap() {
return 0;
}

int main() {
yylex();
}