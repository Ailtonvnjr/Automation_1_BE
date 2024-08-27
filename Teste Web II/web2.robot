
*** Settings ***
Documentation  Esse teste visa fazer pesquisa no site triago
Resource       testeweb2.resource
Resource       Page object/Pesquisa_trivago.robot
Test Setup     Abrir o navegador
Test Teardown  Fechar navegador


*** Test Cases ***
Caso de teste 1 - Etapa III - Automação de Teste Web II
    [Documentation]  Esse teste visa fazer pesquisa no site triago
    [Tags]           pesquisa
    Acessar o site "http://www.trivago.com.br"
    Digitar o valor “Manaus” no campo de busca
    Clicar no botão "Pesquisar" Selecionar a opção Ordenar por “Avaliação e Sugestões"
    Verifique o nome do primeiro da lista
    Verifique a avaliação do primeiro da lista
    Verifique o valor do primeiro da lista
