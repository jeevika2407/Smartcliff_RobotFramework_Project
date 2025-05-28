*** Settings ***
Documentation    Current Availability Test Cases for Smartcliff Admin Website
Library    SeleniumLibrary
Library          DataDriver    file=/Users/sevvelkaranpalanivetrivel/Desktop/RobotPILOT/Smartcliff_RobotFramework_Project/Utility/CurrentAvailability.xlsx    sheet_name=Sheet1    
Resource   ../Resources/GenericResources.robot
Resource   ../Resources/LoginResources.robot
Resource   ../Resources/CurrentAvaliablityResources.robot
Test setup    Open the browser with url
Test Template    Fill Current Availability Form With Excel Data
Test Teardown    Close the broswer session


*** Test Cases ***
Verify the Current Availability Page
    ${username}=    Set Variable    smart@gmail.com
    ${password}=    Set Variable    1234
    Verify the Table conist of Fullstack 

Add Values into the Page
    
    ${skill}    ${resources}    ${duration}    ${batch}    ${exp}    ${remarks}
    

*** Keywords ***
Verify the Current Availability Page
    ${username}=    Set Variable    smart@gmail.com
    ${password}=    Set Variable    1234
    LoginResources.fill the login form   ${username}    ${password}
    CurrentAvaliablityResources.Click on the Menu button and choose Current Availability by Clicking on the Bussiness


Verify the Table conist of Fullstack 
    ${username}=    Set Variable    smart@gmail.com
    ${password}=    Set Variable    1234
    LoginResources.fill the login form   ${username}    ${password}
    CurrentAvaliablityResources.Click on the Menu button and choose Current Availability by Clicking on the Bussiness 
    CurrentAvaliablityResources.Click on Search box and Assert the Fullstack

Fill Current Availability Form With Excel Data
    [Arguments]    ${skill}    ${resources}    ${duration}    ${batch}    ${exp}    ${remarks}
    ${username}=    Set Variable    smart@gmail.com
    ${password}=    Set Variable    1234
    LoginResources.fill the login form   ${username}    ${password}
    CurrentAvaliablityResources.Click on the Menu button and choose Current Availability by Clicking on the Bussiness 
    CurrentAvaliablityResources.Click on the Add New Current Availability button and Add Form Values    ${skill}    ${resources}    ${duration}    ${batch}    ${exp}    ${remarks}

    


