*** Settings ***
Library    SeleniumLibrary

*** Variables ***    
### XPATH PARA ELEMENTOS DE CADASTRO
${CADASTRO_LOGIN}              xpath=//a[@class="login"][contains(text(),"Sign in")]         
${CADASTRO_EMAIL}              xpath=//input[@id="email_create"]
${CADASTRO_CONTA}              xpath=//h3[contains(text(),"Your personal information")]         
${CADASTRO_NOME}               xpath=//input[@id="customer_firstname"]
${CADASTRO_SOBRENOME}          xpath=//input[@id="customer_lastname"]
${CADASTRO_NOMECOMPLETO}       ${CADASTRO_NOME} ${CADASTRO_SOBRENOME}           
${CADASTRO_SENHA}              xpath=//input[@id="passwd"]
${CADASTRO_ADDRESS}            xpath=//input[@id="address1"]
${CADASTRO_CIDADE}             xpath=//input[@id="city"]
${CADASTRO_ESTADO}             xpath=//select[@id="id_state"]
${CADASTRO_POSTALCODE}         xpath=//input[@id="postcode"]
${CADASTRO_TELEFONE}           xpath=//input[@id="phone_mobile"]
${CADASTRO_COLUNA}             xpath=//p[@class="info-account"]
${CADASTRO_GENDER}             xpath=//input[@id="id_gender1"]
${CADASTRO_SUBMIT_CREATE}      xpath=//button[@id="SubmitCreate"]
${CADASTRO_SUBMIT_ACCOUNT}     xpath=//button[@id="submitAccount"]

### VARIAVEIS
${NUM}                         9
${ESTADO}                      xpath=//select[@id="id_state"]//option[@value="${NUM}"]
${BODY}                        xpath=//body
${PAGEDOWN_KEY}                \ue00f    # this is the Page Down key
${NOME}                        Vittorio
${SOBRENOME}                   Perotto
${PASS}                        123456
${ADDRESS}                     Robot Framework Street, 123
${CITY}                        Curitiba
${MSG}                         Welcome to your account. Here you can manage all of your personal information and orders.

*** Keywords ***
### Ações
Clicar em "Sign in"
    Click Element                    ${CADASTRO_LOGIN} 

Informar um e-mail válido
    Wait Until Element Is Visible    ${CADASTRO_EMAIL}  
    ${EMAIL_STRING}                  Generate Random String      6        [LETTERS]
    ${EMAIL_INT}                     Generate Random String      4        [NUMBERS]
    Input Text                       ${CADASTRO_EMAIL}           ${EMAIL_STRING}${EMAIL_INT}@testerobot.com

Clicar em "Create an account"
    Click Button                     ${CADASTRO_SUBMIT_CREATE}

Preencher os dados obrigatórios
    Wait Until Element Is Visible    ${CADASTRO_CONTA}
    Click Element                    ${CADASTRO_GENDER}
    Input Text                       ${CADASTRO_NOME}            ${NOME}
    Input Text                       ${CADASTRO_SOBRENOME}       ${SOBRENOME}
    Input Text                       ${CADASTRO_SENHA}           ${PASS}
    Input Text                       ${CADASTRO_ADDRESS}         ${ADDRESS}
    Input Text                       ${CADASTRO_CIDADE}          ${CITY}
    Press Keys                       ${BODY}                     ${PAGEDOWN_KEY}
    Click Element                    ${CADASTRO_ESTADO}
    Click Element                    ${ESTADO}
    ${POSTALCODE}                    Generate Random String      5          [NUMBERS]
    Input Text                       ${CADASTRO_POSTALCODE}      ${POSTALCODE}
    ${PHONE}                         Generate Random String      8          [NUMBERS]
    Input Text                       ${CADASTRO_TELEFONE}        ${PHONE}

Submeter cadastro
    Click Button                     ${CADASTRO_SUBMIT_ACCOUNT}

### Conferências
Conferir se o cadastro foi efetuado com sucesso
    Wait Until Element Is Visible    ${CADASTRO_COLUNA}
    Element Text Should Be           ${CADASTRO_COLUNA}          ${MSG}