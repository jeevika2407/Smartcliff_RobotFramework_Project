*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://smart-cliff-admin.vercel.app/
${browser}    chrome
${user}    xpath=//div[@class='MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary MuiInputBase-fullWidth MuiInputBase-formControl css-1bp1ao6']/descendant::input[@name='email']
${pass}    xpath=//div[@class='MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary MuiInputBase-fullWidth MuiInputBase-formControl css-1bp1ao6']/descendant::input[@name='password']
${login}    xpath=//button[@id='signin-submit']

*** Keywords ***
Open the browser with url
    Open Browser    ${url}    ${browser}    
    Maximize Browser Window
    Set Selenium Implicit Wait    5
close the broswer session
    Close Browser