*** Settings ***
Documentation       Exemplo de uso de variáveis como argumentos em Keywords

*** Variables ***
&{PESSOA}           name=Vittorio Perotto   email=vittorioperotto@robot.com     idade=17    sexo=masculino

*** Test Cases ***
Caso de Teste de Exemplo 02
    Uma keyword qualquer 02


*** Keywords ***
Uma keyword qualquer 02
    Uma keyword com argumentos      ${PESSOA.nome}      ${PESSOA.email}
    ${MENSAGEM_ALERTA}       Uma subkeyword com retorno        ${PESSOA.nome}     ${PESSOA.idade}
    Log             ${MENSAGEM_ALERTA}

Uma subkeyword com argumentos
    [Arguments]     ${NOME_USUARIO}     ${EMAIL_USUARIO}
    Log             Nome usuário:       ${NOME_USUARIO}
    Log             Email:              ${EMAIL_USUARIO}

Uma subkeyword com retorno
    [Arguments]     ${NOME_USUARIO}     ${IDADE_USUARIO}
    ${MENSAGEM}     Set Variable If     ${IDADE_USUARIO}<18     Não autorizado! O usuário ${NOME_USUARIO} é menor de idade!
    [Return]        ${MENSAGEM}