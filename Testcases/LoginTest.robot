*** Settings ***
Library    SeleniumLibrary
Library    DataDriver    file=D:/SmartCliff_RobotFramework_Project/Utility/logindata.xlsx    sheet_name=Sheet1
Resource   ../Resources/GenericResources.robot
Resource   ../Resources/LoginResources.robot
Test Template    validate login

*** Variables ***
${Username}
${Password}

*** Test Cases ***
Valid Login Test    ${Username}    ${Password}

*** Keywords ***
validate login
    [Arguments]    ${Username}    ${Password}    
    Open the browser with url
    fill the login form    ${Username}    ${Password}
    close the broswer session
