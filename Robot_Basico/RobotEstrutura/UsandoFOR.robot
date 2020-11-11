*** Settings ***
Documentation           Vamos aprender a fazer LOOPS usando Robot Framework!

*** Variables ***
# Indice da Lista        0         1         2          3          4  
# O @ serve como variavel global
@{MINHA_LISTA}          maça    abacaxi    banana    morango    laranja

*** Test Cases ***
Teste de REPEAT KEYWORD=
    [Documentation]     Chama uma mesma keyword várias vezes
    Usando Repeat keyword

Teste de FOR do tipo IN RANGE=
    [Documentation]     Faz um loop dentro de um intervalo que você passar
    Usando FOR IN RANGE

Teste de FOR do tipo IN=
    [Documentation]     Faz um loop percorrendo a lista que você passar
    Usando FOR IN

Teste de FOR do tipo IN ENUMERATE=
    [Documentation]     Faz um loop percorrendo a lista que você passar
    Usando FOR IN ENUMERATE

Teste de Sair do FOR=
    [Documentation]     Você controla quando o FOR deve se encerrar antes de terminar todos os LOOPS
    Usando FOR IN com EXIT FOR LOOP IF

*** Keywords ***
Usando Repeat keyword
    Log To Console      ${\n}
    Repeat keyword      4x      Log To Console      Minha repetição da keyword

Usando FOR IN RANGE
    Log To Console      ${\n}
    # FOR igual python, Tab para indicar que está dentro do FOR e END pra finalizar o FOR
    FOR     ${CONTADOR}     IN RANGE    0   5
        Log To Console      Minha Posição agora é: ${CONTADOR}
        Log                 Minha Posição agora é: ${CONTADOR}
    END

Usando FOR IN
    Log To Console      ${\n}
    FOR     ${FRUTA}    IN   @{MINHA_LISTA}
        Log To Console      Minha fruta é: ${FRUTA}!
        No Operation
    END

Usando FOR IN ENUMERATE
    Log To Console      ${\n}
    FOR    ${INDICE}    ${FRUTA}    IN ENUMERATE     @{MINHA_LISTA}
        Log To Console      Minha fruta é: ${INDICE} --> ${FRUTA}!
        No Operation
    END

Usando FOR IN com EXIT FOR LOOP IF
    Log To Console      ${\n}
    FOR    ${INDICE}    ${FRUTA}    IN ENUMERATE     @{MINHA_LISTA}
        Log To Console      Minha fruta é: ${INDICE} --> ${FRUTA}!
        Exit For Loop If    '${FRUTA}' == 'banana'
    END