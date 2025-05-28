*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/GenericResources.robot
Resource   ../Resources/LoginResources.robot
Resource   ../Resources/HowItWorkResources.robot

*** Variables ***
${Username}    smart@gmail.com
${Password}    1234

*** Test Cases ***
Working with How It Work Page Valid
    Working with How It Work Page    ${Username}    ${Password}
    Working with How It Work Page By clicking icon    ${Username}    ${Password}
    Add New How It Work with Valid Data    ${Username}    ${Password}
    Add New How It Work with Invalid Data    ${Username}    ${Password}
    Search How It Work with Valid Data    ${Username}    ${Password}
    search How It Work with Invalid Data    ${Username}    ${Password}

*** Keywords ***
Working with How It Work Page
    [Arguments]    ${Username}    ${Password}
    GenericResources.Open the browser with url
    LoginResources.fill the login form    ${Username}    ${Password} 
    HowItWorkResources.User visit the How It Work page By clicking on the three lines icon   
    GenericResources.close the broswer session
Working with How It Work Page By clicking icon
    [Arguments]    ${Username}    ${Password}
    GenericResources.Open the browser with url
    LoginResources.fill the login form    ${Username}    ${Password} 
    HowItWorkResources.User visit the How It Work page By clicking icon   
    GenericResources.close the broswer session
Add New How It Work with Valid Data
    [Arguments]    ${Username}    ${Password}
    GenericResources.Open the browser with url
    LoginResources.fill the login form    ${Username}    ${Password}
    HowItWorkResources.User visit the How It Work page By clicking icon
    HowItWorkResources.Add New How It Work with Valid Data
    GenericResources.close the broswer session
Add New How It Work with Invalid Data
    [Arguments]    ${Username}    ${Password}
    GenericResources.Open the browser with url
    LoginResources.fill the login form    ${Username}    ${Password}
    HowItWorkResources.User visit the How It Work page By clicking icon
    HowItWorkResources.Add New How It Work with Invalid Data
    GenericResources.close the broswer session
Search How It Work with Valid Data
    [Arguments]    ${Username}    ${Password}
    GenericResources.Open the browser with url
    LoginResources.fill the login form    ${Username}    ${Password}
    HowItWorkResources.User visit the How It Work page By clicking icon
    HowItWorkResources.Search How It Work with Valid Data    good this is a title
    GenericResources.close the broswer session
search How It Work with Invalid Data
    [Arguments]    ${Username}    ${Password}
    GenericResources.Open the browser with url
    LoginResources.fill the login form    ${Username}    ${Password}
    HowItWorkResources.User visit the How It Work page By clicking icon
    HowItWorkResources.Search How It Work with Invalid Data    abcdefdhijjjj
    GenericResources.close the broswer session