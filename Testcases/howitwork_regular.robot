*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/GenericResources.robot
Resource   ../Resources/LoginResources.robot
Resource   ../Resources/HowItWorkResources.robot
Resource   ../Resources/CareerResources.robot

*** Variables ***
${Username}    smart@gmail.com
${Password}    1234

*** Test Cases ***
clicking on the three lines icon on How It Work Page
    [Tags]    smoke    howitworknavigation
    Working with How It Work Page By clicking on the three lines icon    
Clicking Icon on How It Work Page
    [Tags]    sanity    howitworknavigation
    Working with How It Work Page By clicking icon        
Add New How It Work with Valid Data
    [Tags]    negative    howitworkform
    Add New How It Work with Valid Data      
Search How It Work with Valid Data
    [Tags]    regression    howitworksearchpositive
    Search How It Work with Valid Data         
Search How It Work with Invalid Data
    [Tags]    regression    howitworksearchnegative
    Search How It Work with Invalid Data      
Edit How It Work    
    [Tags]    regression    howitworkedit
    Edit How It Work     
Delete How It Work Entry
    [Tags]    regression    howitworkdelete
    Delete How It Work
Validate Rows Per Page Dropdown
    [Tags]    regression    howitworkrowsperpage
    Validate Rows Per Page Dropdown
User will visit the Career Page By clicking Back which is in the Add New Career Page
    [Tags]    regression    howitworkbackbutton
    User will visit the Career Page By clicking Back which is in the Add New Career Page    
Delete Cancle How It Work Entry
    [Tags]    regression    howitworkdeletecancel
    Delete Cancle How It Work Entry

*** Keywords ***
Working with How It Work Page By clicking on the three lines icon
    GenericResources.Open the browser with url
    LoginResources.fill the login form    ${Username}    ${Password} 
    HowItWorkResources.User visit the How It Work page By clicking on the three lines icon   
    GenericResources.close the browser session
Working with How It Work Page By clicking icon
    GenericResources.Open the browser with url
    LoginResources.fill the login form    ${Username}    ${Password} 
    HowItWorkResources.User visit the How It Work page By clicking icon   
    GenericResources.close the browser session
Add New How It Work with Valid Data
    GenericResources.Open the browser with url
    LoginResources.fill the login form    ${Username}    ${Password}
    HowItWorkResources.User visit the How It Work page By clicking icon
    HowItWorkResources.Add New How It Work with Valid Data    good this is a title    this is a description
    GenericResources.close the browser session
Search How It Work with Valid Data
    GenericResources.Open the browser with url
    LoginResources.fill the login form    ${Username}    ${Password}
    HowItWorkResources.User visit the How It Work page By clicking icon
    HowItWorkResources.Search How It Work with Valid Data    good this is a title
    GenericResources.close the browser session
Search How It Work with Invalid Data
    GenericResources.Open the browser with url
    LoginResources.fill the login form    ${Username}    ${Password}
    HowItWorkResources.User visit the How It Work page By clicking icon
    HowItWorkResources.Search How It Work with Invalid Data    ABCDEFGHIJKLMNOPQRSTUVWXYZ
    GenericResources.close the browser session
Edit How It Work
    GenericResources.Open the browser with url
    LoginResources.fill the login form    ${Username}    ${Password}
    HowItWorkResources.User visit the How It Work page By clicking icon
    HowItWorkResources.Edit How It Work    THIS IS THE NEW TITLE FOR THE HOW IT WORK
    GenericResources.close the browser session
Delete How It Work
    GenericResources.Open the browser with url
    LoginResources.fill the login form    ${Username}    ${Password}
    HowItWorkResources.User visit the How It Work page By clicking icon
    HowItWorkResources.delete How It Work
    GenericResources.close the browser session
Delete Cancle How It Work Entry
    GenericResources.Open the browser with url
    LoginResources.fill the login form    ${Username}    ${Password}
    HowItWorkResources.User visit the How It Work page By clicking icon
    HowItWorkResources.delete Cancel Button
    GenericResources.close the browser session

Validate Rows Per Page Dropdown
    GenericResources.Open the browser with url
    LoginResources.fill the login form    ${Username}    ${Password}
    HowItWorkResources.User visit the How It Work page By clicking icon
    HowItWorkResources.Validate Rows Per Page Dropdown
    GenericResources.close the browser session
User will visit the Career Page By clicking Back which is in the Add New Career Page
    GenericResources.Open the browser with url
    LoginResources.fill the login form    ${Username}    ${Password}
    HowItWorkResources.User visit the How It Work page By clicking icon
    CareerResources.User will visit the Career Page By clicking Back which is in the Add New Career Page
    GenericResources.close the browser session