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
    [Tags]    smoke    careernavigation
    [Documentation]    Working with Career Page by clicking on the three lines icon — by Gowri
    Working with Career Page By clicking on the three lines icon  
clicking Icon on Career Page
    [Tags]    sanity    careernavigation
    [Documentation]    Working with Career Page by clicking icon — by Gowri
    Working with Career Page By clicking icon 
clicking on the Back Button on Career Page
    [Tags]    regression    careerbackbutton
    [Documentation]    Back to Career Page from the Add New Career — by Gowri
    Back to Career Page from the Add New Career 
Create New Career with Valid Data
    [Tags]    regression    careerform
    [Documentation]    Add New Career with valid data — by Gowri
    Add New Career with Valid Data
Search Career with Valid Data
    [Tags]    regression    careersearchpositive
    [Documentation]    Search Career with valid data — by Gowri
    Search Career Valid Data
Search Career with Invalid Data
    [Tags]    regression    careersearchnegative
    [Documentation]    Search Career with invalid data — by Gowri
    Search Career Invalid Data
Edit Career Entry
    [Tags]    regression    careeredit
    [Documentation]    Edit Career entry — by Gowri
    Edit Career
Validate Rows Per Page Dropdown
    [Tags]    regression    careerrowsperpage
    [Documentation]    Validate Rows Per Page dropdown — by Gowri
    Validate Rows Per Page Dropdown
Delete Career Entry
    [Tags]    regression    careerdelete
    [Documentation]    Delete Career entry — by Gowri
    Delete Career
Delete Cancle Career Entry
    [Tags]    regression    careerdeletecancel
    [Documentation]    Cancel delete on Career entry — by Gowri
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
    HowItWorkResources.Validate Rows Per Page Dropdown    5
    