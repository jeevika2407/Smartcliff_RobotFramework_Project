*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://smart-cliff-admin.vercel.app/
${browser}    chrome

*** Keywords ***
Open the browser with url
    Open Browser    ${url}    ${browser}    
    Maximize Browser Window
    Set Selenium Implicit Wait    5
close the broswer session
    Close Browser