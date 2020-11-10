*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${BROWSER}      firefox
${URL}          http://automationpractice.com

*** Keywords ***
### SETUP e TEARDOWN
Abrir navegador
    Open Browser                        ${URL}   ${BROWSER}

Fechar navegador
    Close Browser

### Passo-a-Passo
Acessar a página home do site
    Go To                               ${URL}
    Title Should Be                     My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text                          name=search_query   ${PRODUTO}

Clicar no botão pesquisar
    Click Element                       name=search

Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible       css=#center_column > h1
    Title Should be                     Search - My Story
    Page Should Contain Image           xpath=//*[@id="center_column"]//*[@src='${URL}/img/p/7/7-home_default.jpg']
    Page Should Contain Link            xpath=//*[@id="center_column"]//*[@class="product-name"][contains(text(), "#{PRODUTO}")]

# Conferir mensagem de erro "${MENSAGEM_ALERTA}"
#     Wait Until Element Is Visible       //*[@id="center_column"]/p[@class='alert alert-']
#     Element Text Should Be              //*[@id="center_column"]/p[@class='alert alert-']