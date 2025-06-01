*** Settings ***
Library    SeleniumLibrary
Documentation    Test to logout
Test Setup    Open the browser with URL
Test Teardown    Close The Browser Session
Resource    ../Resources/GenericResources.robot
Resource    ../Resources/LogoutResource.robot
Resource    ../Resources/LoginResources.robot

*** Test Cases ***
validate successful logout
    [Documentation]    Logs into the application using valid credentials and verifies that the user can successfully log out.
    [Tags]    Regression    
    LoginResources.fill the login form    ${username}    ${password}
    logout from current session