*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CADASTRO_TITLE}              xpath=//*[@id="header"]/div[2]//div[1]/a/span       
${CADASTRO_LOGIN}              xpath=//*[@id="header"]//*[@class="login"][contains(text(),"Sign in")]         
${CADASTRO_EMAIL}              id=email_create         
${CADASTRO_CONTA}              xpath=//*[@id="account-creation_form"]//h3[contains(text(),"Your personal information")]         
${CADASTRO_NOME}               id=customer_firstname         
${CADASTRO_SOBRENOME}          id=customer_lastname
${CADASTRO_NOMECOMPLETO}       ${CADASTRO_NOME} ${CADASTRO_SOBRENOME}           
${CADASTRO_SENHA}              id=passwd
${CADASTRO_ADDRESS}            id=address1
${CADASTRO_CIDADE}             id=city
${CADASTRO_ESTADO}             id=id_state
${CADASTRO_POSTALCODE}         id=postcode
${CADASTRO_TELEFONE}           id=phone_mobile
${CADASTRO_COLUNA}             xpath=//*[@id="center_column"]/p
${CADASTRO_GENDER}             id=id_gender2
${CADASTRO_SUBMIT_CREATE}      id=SubmitCreate
${CADASTRO_SUBMIT_ACCOUNT}     submitAccount

*** Keywords ***
### Ações
Clicar em "Sign in"
    Click Element                   ${CADASTRO_LOGIN} 

Informar um e-mail válido
    Wait Until Element Is Visible   ${CADASTRO_EMAIL}  
    ${EMAIL}                        Generate Random String
    Input Text                      ${CADASTRO_EMAIL}      ${EMAIL}@testerobot.com

Clicar em "Create an account"
    Click Button    ${CADASTRO_SUBMIT_CREATE}

Preencher os dados obrigatórios
    Wait Until Element Is Visible   ${CADASTRO_CONTA}
    Click Element                   ${CADASTRO_GENDER}
    Input Text                      ${CADASTRO_NOME}            May
    Input Text                      ${CADASTRO_SOBRENOME}       Fernandes
    Input Text                      ${CADASTRO_SENHA}           123456
    Input Text                      ${CADASTRO_ADDRESS}         Rua Framework, Bairro Robot
    Input Text                      ${CADASTRO_CIDADE}          Floripa
    Set Focus To Element            ${CADASTRO_ESTADO}
    ### No firefox ocorreu problema ao achar o listbox State, então coloquei um if para esperar
    ### pelo elemento quando for firefox
    Run Keyword If    '${BROWSER}'=='firefox'  Wait Until Element Is Visible   ${CADASTRO_ESTADO}
    Select From List By Index       ${CADASTRO_ESTADO}          9
    Input Text                      ${CADASTRO_POSTALCODE}      12345
    Input Text                      ${CADASTRO_TELEFONE}        99988877

Submeter cadastro
    Click Button    ${CADASTRO_SUBMIT_ACCOUNT}

### Conferências
Conferir se o cadastro foi efetuado com sucesso
    Wait Until Element Is Visible    ${CADASTRO_COLUNA}
    Element Text Should Be           ${CADASTRO_COLUNA}
    ...    Welcome to your account. Here you can manage all of your personal information and orders.
    Element Text Should Be           ${CADASTRO_TITLE}    ${CADASTRO_NOMECOMPLETO}

