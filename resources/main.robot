*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String

Resource    ../resources/pages/login.robot
Resource    ../resources/pages/dashboard.robot
Resource    ../resources/pages/account.robot

*** Variables ***


*** Keywords ***

Close browser session
    Close Browser

Wait Until Page Is Ready
    Wait Until Element Is Visible    //body    ${TIMEOUT}