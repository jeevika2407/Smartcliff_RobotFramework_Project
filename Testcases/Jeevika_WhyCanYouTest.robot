*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/GenericResources.robot
Resource   ../Resources/LoginResources.robot
Resource   ../Resources/WhyCanYouResources.robot
Test Teardown    Close The Browser Session
Library    DataDriver    file=../Utility/wcyFilter.csv    encoding=utf_8    dialect=unix
Documentation    This test suite covers end-to-end validation of the 'Why Can You' feature, including login, navigation, form handling, editing, deletion, and definition management in the SmartCliff admin panel.

*** Variables ***
${email}    smart@gmail.com  
${pwd}      1234
${expected_name}    txt

*** Test Cases ***
Verify It Reached Home Page 
    [Documentation]    Logs into the application and verifies redirection to the admin home page.
    [Tags]    smoke    home
    Home Page Verify
    
Verify It Reached "Why Can You" Page by clicking on menu bar
    [Documentation]    Clicks on the menu bar to navigate to the WCY page and verifies URL.
    [Tags]    reg    menubar        
    click menu bar and verify it reached Why Can You Page

Verify It Reached "Why Can You" Page by clicking on icon
    [Documentation]    Navigates to the WCY page by clicking the business icon and verifies the page load.
    [Tags]    smoke    icon
    click icon and verify why can you page

Verify it reached form filling page
    [Documentation]    Navigates from the WCY page to the new hire form and checks the page URL.
    [Tags]    reg    fillform
    Form filling page verify

Add New WCY Hire 
    [Documentation]    Fills in a new hire form and adds a definition; verifies if it appears in the list.
    [Tags]    smoke    addwcy
    Add New Hire Form

Search Title By Name
    [Documentation]    Adds a new entry and verifies the search functionality by title.
    [Tags]    smoke    search
    Verify The Search Functionality

Edit by changing the title
    [Documentation]    Edits a title in the hire definition and verifies if it is updated correctly.
    [Tags]    reg    edit
    verify Update Client Details After Editing

Delete item and checking with count
     [Documentation]    Deletes a definition entry and checks if the item count is reduced.
    [Tags]    smoke    delete
    Verify Delete Works By Checking Count

check the back button
     [Documentation]    Verifies that the back button in the Add Hire form navigates correctly to the previous page.
    [Tags]    smoke    backk
    Verify back button

Add Definition adding many times
      [Documentation]    Adds multiple definitions under a single hire and verifies the count increase.
    [Tags]    smoke    inc
    Add Definition increase in count
    
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

verify Update Client Details After Editing
    Open The Browser With URL
    Fill The Login Form    ${email}    ${pwd}
    Click The Menu Bar
    Click Option Under Menu Bar
    Add A New Hire
    Fill The New Hire Form
    Click On The Add Definition
    Fill The Add Definition Form
    Click On Create
    Click on edit button
    Change the name of the title
    Enter the update button
    Verify that the modified title is listed in the search 

Verify Delete Works By Checking Count
    Open The Browser With URL
    Fill The Login Form    ${email}    ${pwd}
    Click The Menu Bar
    Click Option Under Menu Bar
    Add A New Hire
    Fill The New Hire Form2
    Click On The Add Definition
    Fill The Add Definition Form
    Click On Create
    Search The Item
    Click On The Delete Icon
    Click On Confirm Delete
    Verify Item Is Deleted

Verify back button
    Open The Browser With URL
    Fill The Login Form    ${email}    ${pwd}
    Click The Menu Bar
    Click Option Under Menu Bar
    Add A New Hire
    Click on back button
    Check back button is navigated to previous page

Add Definition increase in count
    Open The Browser With URL
    Fill The Login Form    ${email}    ${pwd}
    Click The Menu Bar
    Click Option Under Menu Bar
    Add A New Hire
    Fill The New Hire Form
    Click On The Add Definition
    Fill The Add Definition Form1
    Again click on add definition
    Fill The Add Definition Form2
    Click On Create


