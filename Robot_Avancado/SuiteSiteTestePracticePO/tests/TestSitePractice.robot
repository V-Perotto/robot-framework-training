*** Settings ***
Resource            ../resources/Resource.robot
Resource            ../resources/PO/Home.robot
Resource            ../resources/PO/Carrinho.robot
Resource            ../resources/PO/Cadastro.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador

*** Test Case ***
Caso de Teste com PO 01: Remover Produtos do Carrinho
    Home.Acessar a página home do site
    Home.Adicionar o produto "t-shirt" no carrinho
    Carrinho.Excluir o produto do carrinho
    Carrinho.Conferir se o carrinho fica vazio

## EXERCÍCIO
Caso de Teste com PO 02: Adicionar Cliente
    # tanto Home. ou Cadastro. significam que essas keywords existem nos correspondentes arquivos .robot
    Home.Acessar a página home do site
    Cadastro.Clicar em "Sign in"
    Cadastro.Informar um e-mail válido
    Cadastro.Clicar em "Create an account"
    Cadastro.Preencher os dados obrigatórios
    Cadastro.Submeter cadastro
    Cadastro.Conferir se o cadastro foi efetuado com sucesso
