#include <stdio.h>
#include <string.h>
#include <ctype.h>

void computeFirst(char production[10][10], int numProductions, char nonTerminal);
void addToResultSet(char resultSet[], char symbol);

char firstSet[20];

void computeFirst(char production[10][10], int numProductions, char nonTerminal) {
    int i, j, k;
    char firstSymbol, temp[2];
    firstSet[0] = '\0';  // initialize result set

    printf("\nFIRST(%c): ", nonTerminal);

    for (i = 0; i < numProductions; i++) {
        if (production[i][0] == nonTerminal) {
            firstSymbol = production[i][3];

            // If first symbol is a terminal
            if (!isupper(firstSymbol)) {
                temp[0] = firstSymbol;
                temp[1] = '\0';
                strcat(firstSet, temp);
            }
            else {
                // If first symbol is a non-terminal
                if (firstSymbol != nonTerminal) {
                    computeFirst(production, numProductions, firstSymbol);
                }
            }
        }
    }
}

void addToResultSet(char resultSet[], char symbol) {
    int i;
    for (i = 0; resultSet[i] != '\0'; i++) {
        if (resultSet[i] == symbol)
            return;
    }
    int len = strlen(resultSet);
    resultSet[len] = symbol;
    resultSet[len + 1] = '\0';
}

int main() {
    char production[10][10];
    int numProductions;
    int i;

    printf("Enter number of productions: ");
    scanf("%d", &numProductions);

    printf("Enter the productions (e.g., E->TR):\n");
    for (i = 0; i < numProductions; i++) {
        scanf("%s", production[i]);
    }

    // Compute FIRST for each non-terminal
    for (i = 0; i < numProductions; i++) {
        char nonTerminal = production[i][0];
        computeFirst(production, numProductions, nonTerminal);
        printf(" { %s }\n", firstSet);
    }

    return 0;
}
