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
    [Tags]    Regression    smoke
    LoginResources.fill the login form    ${username}    ${password}
    logout from current session