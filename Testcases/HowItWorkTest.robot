*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/GenericResources.robot
Resource   ../Resources/LoginResources.robot
Resource   ../Resources/HowItWorkResources.robot

*** Variables ***
${Username}    smart@gmail.com
${Password}    1234

*** Test Cases ***
Working with How It Work Page with Valid Credentials
    Working with How It Work Page    ${Username}    ${Password}
Clicking Icon on How It Work Page
    Working with How It Work Page By clicking icon    ${Username}    ${Password}
Add New How It Work Entry with Valid Data
    Add New How It Work with Valid Data    ${Username}    ${Password}
Add New How It Work Entry with Invalid Data
    Add New How It Work with Invalid Data    ${Username}    ${Password}
Search How It Work with Valid Data
    Search How It Work with Valid Data    ${Username}    ${Password}
Search How It Work with Invalid Data
    search How It Work with Invalid Data    ${Username}    ${Password}
Delete How It Work Entry
    Delete How It Work    ${Username}    ${Password}
Edit How It Work Entry
    Edit How It Work    ${Username}    ${Password}

*** Keywords ***
Working with How It Work Page
    [Arguments]    ${Username}    ${Password}
    GenericResources.Open the browser with url
    LoginResources.fill the login form    ${Username}    ${Password} 
    HowItWorkResources.User visit the How It Work page By clicking on the three lines icon   
    GenericResources.close the browser session
Working with How It Work Page By clicking icon
    [Arguments]    ${Username}    ${Password}
    GenericResources.Open the browser with url
    LoginResources.fill the login form    ${Username}    ${Password} 
    HowItWorkResources.User visit the How It Work page By clicking icon   
    GenericResources.close the browser session
Add New How It Work with Valid Data
    [Arguments]    ${Username}    ${Password}
    GenericResources.Open the browser with url
    LoginResources.fill the login form    ${Username}    ${Password}
    HowItWorkResources.User visit the How It Work page By clicking icon
    HowItWorkResources.Add New How It Work with Valid Data
    GenericResources.close the browser session
Add New How It Work with Invalid Data
    [Arguments]    ${Username}    ${Password}
    GenericResources.Open the browser with url
    LoginResources.fill the login form    ${Username}    ${Password}
    HowItWorkResources.User visit the How It Work page By clicking icon
    HowItWorkResources.Add New How It Work with Invalid Data
    GenericResources.close the browser session
Search How It Work with Valid Data
    [Arguments]    ${Username}    ${Password}
    GenericResources.Open the browser with url
    LoginResources.fill the login form    ${Username}    ${Password}
    HowItWorkResources.User visit the How It Work page By clicking icon
    HowItWorkResources.Search How It Work with Valid Data    good this is a title
    GenericResources.close the browser session
Search How It Work with Invalid Data
    [Arguments]    ${Username}    ${Password}
    GenericResources.Open the browser with url
    LoginResources.fill the login form    ${Username}    ${Password}
    HowItWorkResources.User visit the How It Work page By clicking icon
    HowItWorkResources.Search How It Work with Invalid Data    abcdefdhijjjj
    GenericResources.close the browser session
Edit How It Work
    [Arguments]    ${Username}    ${Password}
    GenericResources.Open the browser with url
    LoginResources.fill the login form    ${Username}    ${Password}
    HowItWorkResources.User visit the How It Work page By clicking icon
    HowItWorkResources.Edit How It Work    the title is changed to new title
    GenericResources.close the browser session
Delete How It Work
    [Arguments]    ${Username}    ${Password}
    GenericResources.Open the browser with url
    LoginResources.fill the login form    ${Username}    ${Password}
    HowItWorkResources.User visit the How It Work page By clicking icon
    HowItWorkResources.delete How It Work
    GenericResources.close the browser session
