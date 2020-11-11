***Test Cases***

Teste FOR usando várias variáveis
    Cria dicionário de traduções

***Keywords***
# Usando várias variáveis
Cria dicionário de traduções
    FOR     ${INDEX}    ${ENGLISH}     ${FINNISH}     ${PORTUGUES}  IN
    ...         1          cat           kissa            gato
    ...         2          dog           koira          cachorro
    ...         3          horse         hevonen         cavalo
        Log     Animal: ${INDEX}\nEm inglês: ${ENGLISH}\nEm finlandês: ${FINNISH}\nEm português: ${PORTUGUES}
    END