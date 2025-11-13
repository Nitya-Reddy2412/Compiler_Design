#include <stdio.h>
#include <string.h>
#include <ctype.h>

#define MAX_PROD 10
#define MAX_LEN  50

char production[MAX_PROD][MAX_LEN];
int numProductions;

int isNonTerminal(char symbol);
void addToResult(char *result, const char *symbol);
void computeFirst(char *result, char nonTerminal, int visited[]);

int main() {
    printf("Enter number of productions: ");
    scanf("%d", &numProductions);

    printf("Enter the productions (like E=TA or F=(E)|id):\n");
    for (int i = 0; i < numProductions; i++) {
        scanf("%s", production[i]);
    }

    printf("\n--- FIRST Sets ---\n");
    for (int i = 0; i < numProductions; i++) {
        char nonTerminal = production[i][0];
        char result[200] = "";
        int visited[26] = {0}; // reset for each nonterminal
        computeFirst(result, nonTerminal, visited);
        printf("FIRST(%c) = { %s }\n", nonTerminal, result);
    }

    return 0;
}

void computeFirst(char *result, char nonTerminal, int visited[]) {
    if (visited[nonTerminal - 'A'])
        return;
    visited[nonTerminal - 'A'] = 1;

    for (int i = 0; i < numProductions; i++) {
        if (production[i][0] == nonTerminal) {
            int j = 2; // skip 'A='
            while (production[i][j] != '\0') {
                if (production[i][j] == '|') { // move to next alternative
                    j++;
                    continue;
                }

                // Case 1: Terminal symbol
                if (!isNonTerminal(production[i][j])) {
                    if (production[i][j] == 'i' && production[i][j + 1] == 'd') {
                        addToResult(result, "id");
                        j += 2;
                    }
                    else if (production[i][j] == 'e') {  // epsilon
                        addToResult(result, "ε");
                        j++;
                    }
                    else {
                        char temp[2] = { production[i][j], '\0' };
                        addToResult(result, temp);
                        j++;
                    }
                }

                // Case 2: Non-terminal symbol
                else {
                    computeFirst(result, production[i][j], visited);
                    j++;
                }

                // Skip till next alternative (|) after processing one symbol
                while (production[i][j] != '|' && production[i][j] != '\0') j++;
            }
        }
    }
}

int isNonTerminal(char symbol) {
    return isupper(symbol);
}

void addToResult(char *result, const char *symbol) {
    if (strstr(result, symbol) == NULL) {
        if (strlen(result) > 0)
            strcat(result, ", ");
        strcat(result, "\"");
        strcat(result, symbol);
        strcat(result, "\"");
    }
}
