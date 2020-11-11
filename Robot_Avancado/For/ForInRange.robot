***Test Cases***

Teste mais opções IN RANGE
    Tradicional
    Apenas quantidade de laços informada (limite superior)
    Aritmético
    Intervalos específicos

***Keywords***

Tradicional
    [Documentation]     Percorre de 1 até 10
    FOR     ${INDEX}    IN RANGE    1     11
        Log     ${INDEX}
    END

Apenas quantidade de laços informada (limite superior)
    [Documentation]     Percorre de 0 até 9
    FOR     ${INDEX}    IN RANGE    10
        Log     ${INDEX}
    END

Aritmético
    [Documentation]     Percorre de 0 até 5
    ${VAR}   Set Variable   ${5}    # Aqui indica pro Robot que 5 é um número que será armazenado na variável VAR
    FOR     ${INDEX}    IN RANGE    ${VAR} + 1        
        Log     ${INDEX}
    END

Intervalos específicos
    [Documentation]     Percorre de 0 até 30, pulando de 5 em 5
    FOR     ${INDEX}    IN RANGE    0     31     5
        Log     ${INDEX}
    END