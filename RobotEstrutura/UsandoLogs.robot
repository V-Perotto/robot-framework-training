***Settings***
Documentation       Suite para exemplificar o uso de LOGs nos testes
...                 Os LOGs são de grande utilidade, faça LOGs para analisar como seu teste está sendo executado nas entrelinhas
...                 Os LOGs te ajudam a achar falhas na automação dos seus testes
...                 Use LOGs sem moderação!
Library             SeleniumLibrary

***Variables***
@{FRUTAS}           maça    banana    uva    abacaxi

***Test Cases***
Caso de Teste exemplo 03
    Usando LOG para mensagens
    Usando LOG Console
    Usando screenshots

***Keywords***
Usando LOG para mensagens
    Log                         Minha mensagem de LOG
    ${VAR}                      Set Variable        variável qualquer
    Log                         Posso logar uma ${VAR} no meio de um log

Usando LOG Console
    Log To Console              Posso logar na saída do console
    Log Many                    Posso logar na minha lista completa @{FRUTAS}
    Log                         Posso logar somente itens da minha lista ${FRUTAS[0]} - ${FRUTAS[1]}

Usando screenshots
    Log                         Nos testes wb, podemos logar Screenshots com a SeleniumLibrary
    Open Browser                http://www.robotizandotestes.blogspot.com.br    firefox
    Capture Page Screenshot     nome_do_screenshot.png
    Close Browser