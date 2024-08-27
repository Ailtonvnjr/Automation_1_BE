*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary

*** Variables ***
${BROWSER}      chrome


*** Keywords ***
Abrir o navegador
    Open Browser    browser=chrome
    Maximize Browser Window

Fechar navegador
    
    Close Browser