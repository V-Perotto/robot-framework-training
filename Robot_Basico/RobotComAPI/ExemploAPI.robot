###
###         ISSO É UM TREINO/EXEMPLO COM ROBOT, PODE SER QUE ESSA API NÃO ESTEJA MAIS FUNCIONANDO
###

*** Settings ***
Documentation   Documentação da API: https://fakerestapi.azurewebsites.net/swagger/ui/index#!/Books
Resource        ../RobotComAPI/ResourceAPI.robot
Suite Setup     Conectar a minha API

*** Test Case ***
Buscar a listagem de todos os livros (GET em todos os livros)
    Requisitar todos os livros
    Conferir o status code  200
    Conferir o reason   OK
    Conferir se retorna uma lista com "200" livros

Buscar um livro específico (GET em um livro específico)
    Requisitar o livro "15"
    Conferir o status code  200
    Conferir o reason   OK
    Conferir se retorna todos os dados corretos do livro "15"
    
Cadastrar um novo livro (POST)
    Cadastrar um novo livro
    Conferir o status code  200
    Conferir o reason   OK
    Conferir se retorna todos os dados cadastrados para o novo livro

Alterar um livro (PUT)
    Conferir se retorna todos os dados alterados do livro "150"
    Conferir o status code  200
    Conferir o reason   OK

Deletar um livro (DELETE)
    Conferir se deleta o livro "200"
    Conferir o status code  200
    Conferir o reason   OK
    