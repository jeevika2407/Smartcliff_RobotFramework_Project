*** Settings ***
Documentation       Valid and Invalid Current Availability Data (empty values = invalid)
Library             SeleniumLibrary
Resource            ../Resources/LoginResources.robot
Resource           ../Resources/GenericResources.robot
Resource            ../Resources/CurrentAvaliablityResources.robot
Test Setup          Open the browser with url
Test Teardown       Close the browser session

*** Test Cases ***

Verify that You are going to CURRENT AVAILABILITY CONTROL PAGE
    ${username}=    Set Variable    smart@gmail.com
    ${password}=    Set Variable    1234
    LoginResources.fill the login form    ${username}    ${password}
    CurrentAvaliablityResources.Click on the Menu button and choose Current Availability by Clicking on the Bussiness
    CurrentAvaliablityResources.Click on Search box and Assert the Fullstack

Make changes in the Full stack Resources by clicking on the Edit button
    ${username}=    Set Variable    smart@gmail.com
    ${password}=    Set Variable    1234
    LoginResources.fill the login form    ${username}    ${password}
    CurrentAvaliablityResources.Click on the Menu button and choose Current Availability by Clicking on the Bussiness
    CurrentAvaliablityResources.Click on the Edit button and make change on the Resources

Delete the Fullstack from Current Avaliablity
    ${username}=    Set Variable    smart@gmail.com
    ${password}=    Set Variable    1234
    LoginResources.fill the login form    ${username}    ${password}
    CurrentAvaliablityResources.Click on the Menu button and choose Current Availability by Clicking on the Bussiness
    CurrentAvaliablityResources.Click on the Delete Button and Assert the Fullstack is not present





