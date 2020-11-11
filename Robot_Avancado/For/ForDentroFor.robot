*** Test Cases ***
# Teste do novo formato do FOR=

Teste de FOR aninhado
    Cria cadastro de produtos (FOR aninhado)

*** Keywords ***
# FOR DENTRO DE FOR (Loop aninhado)
# Não é possível fazer aninhamentos diretamente
# O recomendado é criar uma keyword que chame a outra no laço
Cria cadastro de produtos (FOR aninhado)
    FOR     ${PRODUTO}   IN     baby look   camiseta    blusa
        Imprime tamanhos para o produto     ${PRODUTO}
    END

Imprime tamanhos para o produto
    [Arguments]     ${PRODUTO}
    FOR     ${TAMANHO}   IN     P   M   G
        Log     Produto: ${PRODUTO} - Tam: ${TAMANHO}
    END
