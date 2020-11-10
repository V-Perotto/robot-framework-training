*** Settings ***
Documentation   Documentação da API: https://fakerestapi.azurewebsites.net/swagger/ui/index#!/Books
Library         RequestsLibrary
Library         Collections

*** Variable ***
${URL}          https://fakerestapi.azurewebsites.net/api/

*** Keywords ***
# SETUP e TEARDOWN
Conectar minha API
    Create Session      fakeAPI     ${URL}

Requisitar todos os livros
    ${RESPOSTA}         Get Request     fakeAPI     Books
    Log                 ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}         # Fazer que seja uma variavel para teste, ou seja, para outras funções enxergá-la.

Requisitar o livro "${ID_LIVRO}"
    ${RESPOSTA}         Get Request     fakeAPI     Books/${ID_LIVRO}
    Log                 ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}

Conferir o status code
    [Arguments]         ${STATUS_CODE}
    Should Be Equal As Strings      ${RESPOSTA.status_code}     ${STATUS_CODE}

Conferir o reason
    [Arguments]         ${REASON}
    Should Be Equal As Strings      ${RESPOSTA.reason}      ${REASON}

Conferir se retorna uma lista com "${QTDE_LIVROS}" livros
                            # Precisa ser.json() pois o Robot pode não entender que se trata de uma lista
                            # Praticamente estamos usando .json() no lugar de 'toInt' ou 'int'
    Length Should Be        ${RESPOSTA.json()}      ${QTDE_LIVROS}