*** Settings ***
Documentation           Exemplo de tipos de variáveis: SIMPLES, LISTAS e DICIONÁRIOS

*** Variables ***
# Simples
${GLOBAL_SIMPLES}       Vamos ver os tipos de variáveis no robot!

# Tipo Lista
@{FRUTAS}               morango     banana      maça     uva     abacaxi

# Tipo Dicionário
&{PESSOA}               name=Vittorio Perotto    email=vittorioperotto@robot.com.br    idade=18    sexo=masculino

*** Test Cases ***
Caso de Teste de Exemplo 01
    Uma keyword qualquer 01

*** Keywords ***
Uma keyword qualquer 01
    # Simples
    Log     ${GLOBAL_SIMPLES}

    # Lista                   # Como é somente um item, pode usar $
    Log     Tem que ser MAÇA: ${FRUTAS[2]} e essa tem que ser MORANGO: ${FRUTAS[0]}

    # Dicionário                          # Aqui é o mesmo caso, como é somente um item, pode usar $  
    Log     Nome: ${PESSOA.name} e email: ${PESSOA.email}
