*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${user}    xpath=//div[@class='MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary MuiInputBase-fullWidth MuiInputBase-formControl css-1bp1ao6']/descendant::input[@name='email']
${pass}    xpath=//div[@class='MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary MuiInputBase-fullWidth MuiInputBase-formControl css-1bp1ao6']/descendant::input[@name='password']
${login}    xpath=//button[@id='signin-submit']
${erroremail}    xpath=//div/descendant::p[contains(text(),"Email is required")]
${errorpwd}      xpath=//div/descendant::p[contains(text(),"Password is required")]

${profile}    xpath=//button[@class='MuiButtonBase-root MuiIconButton-root MuiIconButton-sizeSmall css-qx3f9p']
${logout}    xpath=//div[@class='MuiPaper-root MuiPaper-elevation MuiPaper-rounded MuiPaper-elevation0 MuiPopover-paper MuiMenu-paper MuiMenu-paper css-1n607ev']/descendant::li[2]


*** Keywords ***
fill the login form
    [Arguments]    ${Username}    ${Password}
    Input Text    ${user}    ${Username}
    Input Password    ${pass}    ${Password}
    Click Button    ${login}
    Sleep    10