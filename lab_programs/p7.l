#include<stdio.h>

char input[100];
int pos=0;

/*given grammar
S->cAd
A->ab|a */

int match(char c)
{
    if(input[pos++]==c) return 1;
    return 0;
}

int A()
{
    int back = pos;
    if(match('a'))
        if(match('b'))
            return 1;

    pos=back;
    if (match('a'))
        return 1;

    pos=back;
    return 0;
}

int S()
{
    int back = pos;
    if(match('c'))
        if(A())
            if(match('d')) 
                if (match('#'))
                    return 1;
    pos=back;
    return 0;
}

int main()
{
    printf("Enter the input string: ");
    scanf("%s",input);

    pos=0;

    if(S())
        printf("String %s belongs to the given Grammar.\n",input);
    else
        printf("String %s does not belong to the given Grammar.\n",input);
    
    return 0;
}