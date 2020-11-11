###
###         ISSO É UM TREINO/EXEMPLO COM ROBOT, PODE SER QUE ESSA API NÃO ESTEJA MAIS FUNCIONANDO
###

*** Settings ***
Documentation   Documentação da API: https://fakerestapi.azurewebsites.net/swagger/ui/index#!/Books
Library         RequestsLibrary
Library         Collections

*** Variable ***
${URL}          https://fakerestapi.azurewebsites.net/api/
&{BOOK_15}      ID=15
...             Title=Book 15
...             PageCount=1500

*** Keywords ***
# SETUP e TEARDOWN
Conectar a minha API
    Create Session      fakeAPI     ${URL}

Requisitar todos os livros
    ${RESPOSTA}         Get Request     fakeAPI     Books
    Log                 ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}         # Fazer que seja uma variavel para teste, ou seja, para outras funções enxergá-la.

Requisitar o livro "${ID_LIVRO}"
    ${RESPOSTA}         Get Request     fakeAPI     Books/${ID_LIVRO}
    Log                 ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}

Cadastrar um novo livro
    ${HEADERS}          Create Dictionary       content-type=application/json
    ${RESPOSTA}         Post Request    fakeAPI     Books
    ...                 data={"ID": 2323,"Title": "teste","Description": "teste","PageCount": 200,"Excerpt": "teste", "PublishDate": "2017-04-24T15:40:32.702Z"}    
                        # Data pode ser qualquer formato
    ...                 headers=${HEADERS}      # Headers aceita um dicionario
    Log                 ${RESPOSTA.stext}
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

Conferir se retorna todos os dados corretos do livro "${ID_LIVRO}"
    Dictionary Should Contain Item  ${RESPOSTA.json()}      ID              ${BOOK_15.ID}
    Dictionary Should Contain Item  ${RESPOSTA.json()}      Title           ${BOOK_15.Title}
    Dictionary Should Contain Item  ${RESPOSTA.json()}      PageCount       ${BOOK_15.PageCount}
    Should Not Be Empty             ${RESPOSTA.json()["Description"]}
    Should Not Be Empty             ${RESPOSTA.json()["Excerpt"]}
    Should Not Be Empty             ${RESPOSTA.json()["PublishDate"]}


Conferir se retorna todos os dados alterados do livro "${ID_LIVRO}"
    ${RESPOSTA}         Put Request     fakeAPI     Books/${ID_LIVRO}
    Log                 ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}

Conferir se deleta o livro "${ID_LIVRO}"
    ${RESPOSTA}         Delete Request     fakeAPI     Books/${ID_LIVRO}
    Log                 ${RESPOSTA.text}
    Set Test Variable   ${RESPOSTA}
