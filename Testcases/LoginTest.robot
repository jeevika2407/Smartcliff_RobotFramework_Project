*** Settings ***
Library    SeleniumLibrary
Library    DataDriver   file=../Utility/logindata.xlsx    sheet_name=Sheet1
Resource   ../Resources/GenericResources.robot
Resource   ../Resources/LoginResources.robot
Test Template    validate login

*** Variables ***
${Username}
${Password}    

*** Test Cases ***
Validate Login Test    ${Username}    ${Password}

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

