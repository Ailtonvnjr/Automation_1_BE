*** Settings ***
Library     SeleniumLibrary
Library     String

*** Variables ***
${TIME}            10
${URL}             http://www.trivago.com.br
${CIDADE}          Manaus
${PESQUISA}        //input[contains(@autocapitalize,'off')]
${BTN_PESQUISAR}   //button[@type='button'][contains(.,'Pesquisar')]
${ORDENAR}         //option[@value='6'][contains(.,'Avaliação e sugestões')]
${FILTRO}          //strong[@class='mb-1 pl-3 truncate block text-left'][contains(.,'Filters')]
${NOME}            (//h2[@class='Heading_heading__xct3h Heading_h-s___YnjF ItemNameSection_nameWithFav__mi6zT'])[1]
${AVALIACAO}       (//strong[contains(@class,'leading-none')])[1]
${VALOR}           (//p[@itemprop='price'])[1]
*** Keywords ***

Acessar o site "http://www.trivago.com.br"
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${BTN_PESQUISAR}
    

Digitar o valor “Manaus” no campo de busca
    Delete All Cookies
    Click Element    locator=${PESQUISA}
    Input Text       locator=${PESQUISA}    text=${CIDADE}
    Wait Until Element Is Enabled    locator=//div[@class='flex items-center h-14'][contains(.,'ManausCidade · Amazonas, Brasil')]
    Set Selenium Implicit Wait    value=${TIME}
    Double Click Element    locator=//div[@class='flex items-center h-14'][contains(.,'ManausCidade · Amazonas, Brasil')]
    
Clicar no botão "Pesquisar" Selecionar a opção Ordenar por “Avaliação e Sugestões"
    Set Selenium Implicit Wait    value=${TIME}
    Double Click Element    locator=${BTN_PESQUISAR}
    Set Selenium Implicit Wait    value=${TIME}
    Click Element    locator=${ORDENAR}
    Double Click Element    locator=${BTN_PESQUISAR}
    
Verifique o nome do primeiro da lista
    Set Selenium Implicit Wait    value=${TIME}
    Element Text Should Be    locator=${NOME}    expected=ibis budget Manaus

Verifique a avaliação do primeiro da lista
    ${AVALIACAO_TEXT}  Get Text    locator=${AVALIACAO}
    Element Text Should Be    locator=${AVALIACAO}    expected=${AVALIACAO_TEXT}
    Log To Console    Avaliação: ${AVALIACAO_TEXT}


Verifique o valor do primeiro da lista
    ${VALOR_ATUAL}  Get Text    locator=${VALOR}
    Log To Console    Valor atual: ${VALOR_ATUAL}


        

