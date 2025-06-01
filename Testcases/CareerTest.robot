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
clicking on the Back Button on Career Page
    [Tags]    regression  
    Back to Career Page from the Add New Career 
Create New Career with Valid Data
    [Tags]    regression  
    Add New Career with Valid Data
Search Career with Valid Data
    [Tags]    regression  
    Search Career Valid Data
Search Career with Invalid Data
    [Tags]    regression  
    Search Career Invalid Data
Edit Career Entry
    [Tags]    regression  
    Edit Career
Validate Rows Per Page Dropdown
    [Tags]    regression  
    Validate Rows Per Page Dropdown
Delete Career Entry
    [Tags]    regression  
    Delete Career
Delete Cancle Career Entry
    [Tags]    regression  
    Delete Cancle Career Entry
*** Keywords ***
Working with Career Page By clicking on the three lines icon
    LoginResources.fill the login form    ${Username}    ${Password} 
    CareerResources.User visit the Career Page By clicking on the three lines icon
Working with Career Page By clicking icon
    LoginResources.fill the login form    ${Username}    ${Password} 
    CareerResources.User visit the Career Page By clicking icon
Back to Career Page from the Add New Career
    LoginResources.fill the login form    ${Username}    ${Password} 
    CareerResources.User will visit the Career Page By clicking Back which is in the Add New Career Page
Add New Career with Valid Data
    LoginResources.fill the login form    ${Username}    ${Password}
    CareerResources.Add New Career with Valid Data    good this is a title    this is a description    this is subtitle    this is a sub description
Delete Career
    LoginResources.fill the login form    ${Username}    ${Password}
    CareerResources.User visit the Career Page By clicking icon
    CareerResources.delete Career
Delete Cancle Career Entry
    LoginResources.fill the login form    ${Username}    ${Password}
    CareerResources.User visit the Career Page By clicking icon
    CareerResources.Delete Cancel Button
Edit Career
    LoginResources.fill the login form    ${Username}    ${Password}
    CareerResources.User visit the Career Page By clicking icon
    CareerResources.Edit How It Work    the new title 
Search Career Valid Data
    LoginResources.fill the login form    ${Username}    ${Password}
    CareerResources.User visit the Career Page By clicking icon
    CareerResources.Search Career Valid Data    good this is a title
Search Career Invalid Data
    LoginResources.fill the login form    ${Username}    ${Password}
    CareerResources.User visit the Career Page By clicking icon
    CareerResources.Search Career Invalid Data    ABCDEDFGHIJKLMNOPQRSTUVWXYZ
Validate Rows Per Page Dropdown
    LoginResources.fill the login form    ${Username}    ${Password}
    CareerResources.User visit the Career Page By clicking icon
    HowItWorkResources.Validate Rows Per Page Dropdown
    