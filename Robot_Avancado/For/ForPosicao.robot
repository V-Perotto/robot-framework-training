***Test Cases***

Teste FOR com numeração da lista
    For com numeração

***Keywords***

# For para percorrer uma lista e saber a posição dessa lista no loop 
For com numeração
    FOR     ${INDEX}    ${ITEM}     IN ENUMERATE    P   M   G   GG   XG   XXG
        Log     Item da lista ${ITEM} - Posição do item na lista: ${INDEX}
    END 