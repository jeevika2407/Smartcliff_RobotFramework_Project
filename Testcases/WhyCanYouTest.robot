*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/GenericResources.robot
Resource   ../Resources/LoginResources.robot
Resource   ../Resources/WhyCanYouResources.robot
Test Teardown    Close The Browser Session

*** Variables ***
${email}    smart@gmail.com  
${pwd}      1234
${expected_name}    txt

*** Test Cases ***
Verify It Reached Home Page
    Home Page Verify
Verify It Reached "Why Can You" Page
    Why Can You Page Verify
Verify it reached form filling page
    Form filling page verify
Add New WCY Hire After Successful Login
    Add New Hire Form

# Search Title By Name
#     Verify The Search Functionality

*** Keywords ***
Home Page Verify
    Open The Browser With URL
    Fill The Login Form    ${email}    ${pwd}
    Location Should Be    https://smart-cliff-admin.vercel.app/adminHome

Why Can You Page Verify
    Open The Browser With URL
    Fill The Login Form    ${email}    ${pwd}
    Click The Menu Bar
    Click Option Under Menu Bar
    Location Should Be    https://smart-cliff-admin.vercel.app/business/wcy-hire-control

Form filling page verify
    Open The Browser With URL
    Fill The Login Form    ${email}    ${pwd}
    Click The Menu Bar
    Click Option Under Menu Bar
    Add A New Hire
    Location Should Be    https://smart-cliff-admin.vercel.app/business/wcy-hire-add

Add New Hire Form
    Open The Browser With URL
    Fill The Login Form    ${email}    ${pwd}
    Click The Menu Bar
    Click Option Under Menu Bar
    Add A New Hire
    Fill The New Hire Form
    Click On The Add Definition
    Fill The Add Definition Form
    Click On Create
    Wait Until Page Contains Element    ${actual-name-list}    timeout=10s
    Check If Name Exists In Filtered List    ${expected_name}
