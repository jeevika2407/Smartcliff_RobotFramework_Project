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
    [Tags]    smoke    home
    Home Page Verify
Verify It Reached "Why Can You" Page by clicking on menu bar
    [Tags]    reg    menubar        
    click menu bar and verify it reached Why Can You Page
Verify It Reached "Why Can You" Page by clicking on icon
    [Tags]    smoke    icon
    click icon and verify why can you page
Verify it reached form filling page
    [Tags]    reg    fillform
    Form filling page verify
Add New WCY Hire After Successful Login
    [Tags]    smoke    addwcy
    Add New Hire Form
Search Title By Name
    [Tags]    smoke    search
    Verify The Search Functionality

*** Keywords ***
Home Page Verify
    Open The Browser With URL
    Fill The Login Form    ${email}    ${pwd}
    Location Should Be    https://smart-cliff-admin.vercel.app/adminHome

click menu bar and verify it reached Why Can You Page
    Open The Browser With URL
    Fill The Login Form    ${email}    ${pwd}
    Click The Menu Bar
    Click Option Under Menu Bar
    Location Should Be    https://smart-cliff-admin.vercel.app/business/wcy-hire-control

click icon and verify why can you page
    Open The Browser With URL
    Fill The Login Form    ${email}    ${pwd}
    Click The Menu Bar
    Click icon of business under menu icon
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
    Check If Name Exists In Filtered List    ${expected_name}

Verify The Search Functionality
    Open The Browser With URL
    Fill The Login Form    ${email}    ${pwd}
    Click The Menu Bar
    Click Option Under Menu Bar
    Add A New Hire
    Fill The New Hire Form
    Click On The Add Definition
    Fill The Add Definition Form
    Click On Create
    Enter a name in the input field.
    The entered name should be displayed in the filter section below.





