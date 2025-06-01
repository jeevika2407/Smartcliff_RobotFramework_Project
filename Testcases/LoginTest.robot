*** Settings ***
Library    SeleniumLibrary
Library    DataDriver   file=../Utility/logindata.xlsx    sheet_name=Sheet1
Resource   ../Resources/GenericResources.robot
Resource   ../Resources/LoginResources.robot
Test Template    validate login
Test Teardown       Close the browser session

*** Variables ***
${Username}
${Password}    

*** Test Cases ***
Validate Login Test    ${Username}    ${Password}
    [Tags]    smoke    login

*** Keywords ***
validate login
    [Arguments]    ${Username}    ${Password}    
    Open the browser with url
    fill the login form    ${Username}    ${Password}

    IF    '${Username}' == '' and '${Password}' == ''
        Page Should Contain Element    ${erroremail}
        Page Should Contain Element    ${errorpwd}
    ELSE IF    '${Username}' == ''
        Page Should Contain Element    ${erroremail}
    ELSE IF    '${Password}' == ''
        Page Should Contain Element    ${errorpwd}
    ELSE
        Location Should Be    https://smart-cliff-admin.vercel.app/adminHome
    END

    Close Browser

validate logout Test
    Open the browser with url
    fill the login form    smart@gmail.com    1234
    Wait Until Element Is Visible    ${profile}    10s
    Click Element    ${profile}
    Click Element    ${logout}
    Sleep    1
    Click Element    ${logout}
    Wait Until Element Is Visible    xpath=//div[@class='MuiTypography-root MuiTypography-h4 MuiTypography-gutterBottom css-kkb3ro']    10s
    ${front_text}=    Get Text    xpath=//div[@class='MuiTypography-root MuiTypography-h4 MuiTypography-gutterBottom css-kkb3ro']
    Should Be Equal As Strings    ${front_text}    Log in to your account
    Log    Successfully logged out and returned to login page.
    Close Browser

    

