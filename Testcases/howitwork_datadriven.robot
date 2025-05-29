*** Settings ***
Library    SeleniumLibrary
Library    DataDriver    file=../Utility/sample.csv    encoding=utf_8    dialect=unix
Resource   ../Resources/GenericResources.robot
Resource   ../Resources/LoginResources.robot
Resource   ../Resources/HowItWorkResources.robot

*** Variables ***
${Username}    smart@gmail.com
${Password}    1234

*** Test Cases ***
Add New How It Work Entry with Invalid Data
    [Tags]    smoke    datadriven
    [Template]    Add New How It Work with Invalid Data
    ${Heading}    ${Description_name}

*** Keywords ***
Add New How It Work with Invalid Data
    [Arguments]    ${Heading}=${EMPTY}    ${Description_name}=${EMPTY}
    # Convert "NA" to empty string
    ${Heading}=    Run Keyword If    '${Heading}' == 'NA'    Set Variable    ${EMPTY}    ELSE    Set Variable    ${Heading}
    ${Description_name}=    Run Keyword If    '${Description_name}' == 'NA'    Set Variable    ${EMPTY}    ELSE    Set Variable    ${Description_name}

    Log    Heading: ${Heading}
    Log    Description: ${Description_name}
    GenericResources.Open the browser with url
    LoginResources.fill the login form    ${Username}    ${Password}
    HowItWorkResources.User visit the How It Work page By clicking icon
    Run Keyword If    '${Heading}' == ''    Log    Warning: Heading is empty
    Run Keyword If    '${Description_name}' == ''    Log    Warning: Description is empty
    HowItWorkResources.Add New How It Work with Invalid Data    ${Heading}    ${Description_name}
    GenericResources.close the browser session

