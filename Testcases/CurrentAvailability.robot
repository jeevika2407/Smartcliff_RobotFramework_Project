*** Settings ***
Documentation       Valid and Invalid Current Availability Data (empty values = invalid)
Library             SeleniumLibrary
Library             DataDriver    file=../Utility/CurrentAvailability.xlsx    sheet_name=Sheet1
Resource            ../Resources/LoginResources.robot
Resource           ../Resources/GenericResources.robot
Resource            ../Resources/CurrentAvaliablityResources.robot

Test Template       Validate Current Availability Data Entry
Test Setup          Open the browser with url
Test Teardown       Close the browser session

*** Test Cases ***

Current Availability Entry Test
    [Tags]    current_availability      regression
    Validate Current Availability Data Entry

# Performing Delete Action in Current Availability
#     [Template]    NONE
#     Assert wheather the page is in CURRENT AVAILABILITY CONTROL PAGE
#     Click on the Delete Button and Assert the Fullstack is not present

*** Keywords ***

Validate Current Availability Data Entry
    [Arguments]    ${skill}    ${resources}    ${duration}    ${batch}    ${exp}    ${remarks}    ${type}
    ${username}=    Set Variable    smart@gmail.com
    ${password}=    Set Variable    1234
    LoginResources.fill the login form    ${username}    ${password}
    CurrentAvaliablityResources.Click on the Menu button and choose Current Availability by Clicking on the Bussiness
    CurrentAvaliablityResources.Click on the Add New Current Availability button and Add Form Values    ${skill}    ${resources}    ${duration}    ${batch}    ${exp}    ${remarks}
    sleep    2s
    Run Keyword If    '${type}' == 'invalid'    Assert Form Error Messages Are Displayed
    


    



