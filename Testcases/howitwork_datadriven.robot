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
Add New How It Work Entry with Valid Data
    [Tags]    smoke    datadriven
    [Template]    Add New How It Work with Valid Data
    ${Heading}    ${Description_name}

*** Keywords ***
Add New How It Work with Valid Data
    [Arguments]    ${Heading}    ${Description_name}
    GenericResources.Open the browser with url
    LoginResources.fill the login form    ${Username}    ${Password}
    HowItWorkResources.User visit the How It Work page By clicking icon
    HowItWorkResources.Add New How It Work with Valid Data    ${Heading}    ${Description_name}
    GenericResources.close the browser session
