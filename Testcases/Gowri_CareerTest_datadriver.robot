*** Settings ***
Library    SeleniumLibrary
Library    DataDriver    file=../Utility/sample1.csv    encoding=utf_8    dialect=unix
Resource   ../Resources/GenericResources.robot
Resource   ../Resources/LoginResources.robot
Resource   ../Resources/CareerResources.robot
Test Setup       Open the browser with url
Test Teardown    Close the browser session

*** Variables ***
${Username}    smart@gmail.com
${Password}    1234

*** Test Cases ***
Create New Career with Valid Data
    [Tags]    regression    datadriven
    [Documentation]    Data-driven test to create a new career with various inputs — by Gowri
    [Template]    Add New Career with Invalid Data
    ${title_name}    ${Description_name}    ${subtitle_name}    ${subdescription_name}

*** Keywords ***
Add New Career with Invalid Data
    [Arguments]    ${title_name}=${EMPTY}    ${Description_name}=${EMPTY}    ${subtitle_name}=${EMPTY}    ${subdescription_name}=${EMPTY}
    ${title_name}=           Run Keyword If    '${title_name}' == 'NA'           Set Variable    ${EMPTY}    ELSE    Set Variable    ${title_name}
    ${Description_name}=     Run Keyword If    '${Description_name}' == 'NA'     Set Variable    ${EMPTY}    ELSE    Set Variable    ${Description_name}
    ${subtitle_name}=        Run Keyword If    '${subtitle_name}' == 'NA'        Set Variable    ${EMPTY}    ELSE    Set Variable    ${subtitle_name}
    ${subdescription_name}=  Run Keyword If    '${subdescription_name}' == 'NA'  Set Variable    ${EMPTY}    ELSE    Set Variable    ${subdescription_name}

    Log    Title: ${title_name}
    Log    Description: ${Description_name}
    Log    Subtitle: ${subtitle_name}
    Log    Subdescription: ${subdescription_name}

    LoginResources.fill the login form    ${Username}    ${Password}
    CareerResources.Add New Career with Invalid Data   ${title_name}    ${Description_name}    ${subtitle_name}    ${subdescription_name}
