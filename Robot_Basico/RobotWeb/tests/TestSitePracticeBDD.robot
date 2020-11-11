*** Settings ***
Resource            ../resource/Resource.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador

### SETUP ele roda keyword antes do suite ou antes de um Teste
### TEARDOWN ele roda keyword depois de uma suite ou um teste

*** Test Case ***
Cenário 01: Pesquisar existente
    Dado que estou na página home do site
    Quando eu pesquisar pelo produto "Blouse"
    Então o produto deve ser listado na página de resultado da busca

*** Keywords ***

Dado que estou na página home do site
    Acessar a página home do site

Quando eu pesquisar pelo produto "${PRODUTO}"
    Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Clicar no botão pesquisar

Então o produto "${PRODUTO}" deve ser listado na página de resultado da busca
    Conferir se o produto "${PRODUTO}" foi listado no site

# Então a página deve exibir a mensagem "${MENSAGEM_ALERTA}"
#     Conferir mensagem de erro "${MENSAGEM_ALERTA}"