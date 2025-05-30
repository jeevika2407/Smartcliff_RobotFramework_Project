*** Settings ***
Documentation    Learning Journey Test Cases for Smartcliff Admin Website
Library          SeleniumLibrary
Library          DataDriver    file=../Utility/LPEXCEL.xlsx    sheet_name=Sheet1
Resource         ../Resources/LoginResources.robot
Resource         ../Resources/GenericResources.robot
Resource         ../Resources/LearningJourneyResources.robot
Test Template    Add Learning Journey From Excel
Test Setup       Open the browser with url
Test Teardown    Close the browser session

*** Test Cases ***

# Test case to add Learning Journey entries using data-driven values from Excel
Add Journey from Excel
    
    [Tags]    Learning_Journey      regression

*** Keywords ***

# Keyword to add a new Learning Journey using form inputs provided from Excel
Add Learning Journey From Excel

    [Arguments]    ${title}    ${desc}    ${img}    ${type}
    ${username}=    Set Variable    smart@gmail.com
    ${password}=    Set Variable    1234
    LoginResources.fill the login form    ${username}    ${password}
    LearningJourneyResources.Click on the Menu Button and Click on Bussiness
    LearningJourneyResources.Click on Learning Journey from Bussiness
    LearningJourneyResources.Click on Search box and Insert Value as hirefromus
    LearningJourneyResources.Click on Add new Learning Journey button and Fill the Form    ${title}    ${desc}    ${img}    

    Run Keyword If    '${type}' == 'invalid'    Assert Error Messages Are Displayed
