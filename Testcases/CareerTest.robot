*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/GenericResources.robot
Resource   ../Resources/LoginResources.robot
Resource   ../Resources/HowItWorkResources.robot
Resource   ../Resources/CareerResources.robot
Test Setup          Open the browser with url
Test Teardown       Close the browser session

*** Variables ***
${Username}    smart@gmail.com
${Password}    1234

*** Test Cases ***
clicking on the three lines icon on Career Page
    [Tags]    smoke  
    Working with Career Page By clicking on the three lines icon  
clicking Icon on Career Page
    [Tags]    sanity  
    Working with Career Page By clicking icon  

*** Keywords ***
Working with Career Page By clicking on the three lines icon
    LoginResources.fill the login form    ${Username}    ${Password} 
    CareerResources.User visit the Career Page By clicking on the three lines icon
Working with Career Page By clicking icon
    LoginResources.fill the login form    ${Username}    ${Password} 
    CareerResources.User visit the Career Page By clicking icon


