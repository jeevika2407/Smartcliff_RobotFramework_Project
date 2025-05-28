*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/GenericResources.robot
Resource   ../Resources/LoginResources.robot
Resource   ../Resources/WhyCanYouResources.robot

*** Variables ***
${email}    smart@gmail.com  
${pwd}      1234
${expected_name}    txt

*** Test Cases ***
Add New Hire Flow After Successful Login
    add new hire form
    
*** Keywords ***
add new hire form
    Open the browser with url
    fill the login form    ${email}    ${pwd}
    Location Should Be    https://smart-cliff-admin.vercel.app/adminHome

    Click The Menu Bar
    Click Option Under Menu Bar
    Add A New Hire
    Fill The New Hire Form

    Click on the add definition
    Fill the add definition form
    Click on create

    Wait Until Page Contains Element    ${actual-name-list}    timeout=10s
    Check If Name Exists In Filtered List    ${expected_name}
    
    Close Browser

