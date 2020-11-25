*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CADASTRO_TITLE}              xpath=//header[@id="header"]       
${CADASTRO_LOGIN}              xpath=//a[@class="login"][contains(text(),"Sign in")]         
${CADASTRO_EMAIL}              xpath=//input[@id="email_create"]
${CADASTRO_CONTA}              xpath=//h3[contains(text(),"Your personal information")]         
${CADASTRO_NOME}               xpath=//input[@id="customer_firstname"]
${CADASTRO_SOBRENOME}          xpath=//input[@id="customer_lastname"]
${CADASTRO_NOMECOMPLETO}       ${CADASTRO_NOME} ${CADASTRO_SOBRENOME}           
${CADASTRO_SENHA}              xpath=//input[@id="passwd"]
${CADASTRO_ADDRESS}            xpath=//input[@id="address1"]
${CADASTRO_CIDADE}             xpath=//input[@id="city"]
${CADASTRO_ESTADO}             xpath=//select[@name="id_state"]
${CADASTRO_POSTALCODE}         xpath=//input[@id="postcode"]
${CADASTRO_TELEFONE}           xpath=//input[@id="phone_mobile"]
${CADASTRO_COLUNA}             xpath=//*[@id="center_column"]/p
${CADASTRO_GENDER}             xpath=//input[@id="id_gender1"]
${CADASTRO_SUBMIT_CREATE}      xpath=//button[@id="SubmitCreate"]
${CADASTRO_SUBMIT_ACCOUNT}     xpath=//button[@id="submitAccount"]

${NUM}                         9
${BODY}                        xpath=//body
${PAGEDOWN_KEY}                \ue00f    # this is the Page Down key

*** Keywords ***
### Ações
Clicar em "Sign in"
    Click Element                    ${CADASTRO_LOGIN} 

Informar um e-mail válido
    Wait Until Element Is Visible    ${CADASTRO_EMAIL}  
    ${EMAIL_STRING}                  Generate Random String      6        [LETTERS]
    ${EMAIL_INT}                     Generate Random String      4        [NUMBERS]
    Input Text                       ${CADASTRO_EMAIL}      ${EMAIL_STRING}${EMAIL_INT}@testerobot.com

Clicar em "Create an account"
    Click Button                     ${CADASTRO_SUBMIT_CREATE}

Preencher os dados obrigatórios
    Wait Until Element Is Visible    ${CADASTRO_CONTA}
    Click Element                    ${CADASTRO_GENDER}
    Input Text                       ${CADASTRO_NOME}            Vittorio
    Input Text                       ${CADASTRO_SOBRENOME}       Perotto
    ${POSTALCODE}                    Generate Random String      6          [NUMBERS]
    Input Text                       ${CADASTRO_SENHA}           ${POSTALCODE}
    Input Text                       ${CADASTRO_ADDRESS}         Rua Framework, Bairro Robot
    Input Text                       ${CADASTRO_CIDADE}          Floripa
    Press Keys                       ${BODY}                     ${PAGEDOWN_KEY}
    Set Focus To Element             ${CADASTRO_ESTADO}
    Wait Until Element Is Visible    ${CADASTRO_ESTADO}
    Select From List By Label        ${CADASTRO_ESTADO}          ${NUM}
    Input Text                       ${CADASTRO_POSTALCODE}      $POSTALCODE
    ${PHONE}                         Generate Random String      8          [NUMBERS]
    Input Text                       ${CADASTRO_TELEFONE}        ${PHONE}

Submeter cadastro
    Click Button                     ${CADASTRO_SUBMIT_ACCOUNT}

### Conferências
Conferir se o cadastro foi efetuado com sucesso
    Wait Until Element Is Visible    ${CADASTRO_COLUNA}
    Element Text Should Be           ${CADASTRO_COLUNA}
    ...    Welcome to your account. Here you can manage all of your personal information and orders.
    Element Text Should Be           ${CADASTRO_TITLE}    ${CADASTRO_NOMECOMPLETO}