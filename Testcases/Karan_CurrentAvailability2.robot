*** Settings ***
Documentation       Valid and Invalid Current Availability Data 
Library             SeleniumLibrary
Resource            ../Resources/LoginResources.robot
Resource            ../Resources/GenericResources.robot
Resource            ../Resources/CurrentAvaliablityResources.robot
Test Setup          Open the browser with url
Test Teardown       Close the browser session

*** Test Cases ***

# Test to verify that the user can navigate to the Current Availability Control page successfully
Verify that You are going to CURRENT AVAILABILITY CONTROL PAGE

    [Tags]    smoke    current_availability

    ${username}=    Set Variable    smart@gmail.com
    ${password}=    Set Variable    1234
    LoginResources.fill the login form    ${username}    ${password}
    CurrentAvaliablityResources.Click on the Menu button and choose Current Availability by Clicking on the Bussiness
    CurrentAvaliablityResources.Click on Search box and Assert the Fullstack

# Test to edit Fullstack resource data on the Current Availability page
Make changes in the Full stack Resources by clicking on the Edit button

    [Tags]    regression    edit_resources

    ${username}=    Set Variable    smart@gmail.com
    ${password}=    Set Variable    1234
    LoginResources.fill the login form    ${username}    ${password}
    CurrentAvaliablityResources.Click on the Menu button and choose Current Availability by Clicking on the Bussiness
    CurrentAvaliablityResources.Click on the Edit button and make change on the Resources

# Test to delete Fullstack resource and validate its removal
Delete the Fullstack from Current Avaliablity

    [Tags]    regression    delete_resources

    ${username}=    Set Variable    smart@gmail.com
    ${password}=    Set Variable    1234
    LoginResources.fill the login form    ${username}    ${password}
    CurrentAvaliablityResources.Click on the Menu button and choose Current Availability by Clicking on the Bussiness
    CurrentAvaliablityResources.Click on the Delete Button and Assert the Fullstack is not present

# Test to check that pagination on the Current Availability page functions correctly
Verify the pagination works

    [Tags]    regression 

    ${username}=    Set Variable    smart@gmail.com
    ${password}=    Set Variable    1234
    LoginResources.fill the login form    ${username}    ${password}
    CurrentAvaliablityResources.Click on the Menu button and choose Current Availability by Clicking on the Bussiness
    CurrentAvaliablityResources.Click on the Pagination
