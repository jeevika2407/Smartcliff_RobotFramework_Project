*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${user}    xpath=//div[@class='MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary MuiInputBase-fullWidth MuiInputBase-formControl css-1bp1ao6']/descendant::input[@name='email']
${pass}    xpath=//div[@class='MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary MuiInputBase-fullWidth MuiInputBase-formControl css-1bp1ao6']/descendant::input[@name='password']
${login}    xpath=//button[@id='signin-submit']
${erroremail}    xpath=//div/descendant::p[contains(text(),"Email is required")]
${errorpwd}      xpath=//div/descendant::p[contains(text(),"Password is required")]


*** Keywords ***
fill the login form
    [Arguments]    ${Username}    ${Password}
    Input Text    ${user}    ${Username}
    Input Password    ${pass}    ${Password}
    Click Button    ${login}
    Sleep    5
