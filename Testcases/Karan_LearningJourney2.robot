*** Settings ***
Documentation    Learning Journey Test Cases for Smartcliff Admin Website to Edit and Delete
Library    SeleniumLibrary
Resource         ../Resources/LoginResources.robot
Resource         ../Resources/GenericResources.robot
Resource         ../Resources/Karan_LearningJourneyResources.robot
Test Setup       Open the browser with url
Test Teardown    Close the browser session

*** Test Cases ***

# Test to log in and navigate to the Learning Journey section
Login and Navigate to Learning Journey

    [Tags]    smoke    regression

    LoginResources.fill the login form    ${username}    ${password}
    LearningJourneyResources.Click on the Menu Button and Click on Bussiness
    LearningJourneyResources.Click on Learning Journey from Bussiness
    LearningJourneyResources.Click on Search box and Insert Value as hirefromus

# Test to assert "hirefromus" is shown in the table
Assert hirefromus in the Tablular Display

    [Tags]    regression    sanity

    LoginResources.fill the login form    ${username}    ${password}
    LearningJourneyResources.Click on the Menu Button and Click on Bussiness
    LearningJourneyResources.Click on Learning Journey from Bussiness
    LearningJourneyResources.Click on Search box and Insert Value as hirefromus
    LearningJourneyResources.Asserting the hirefromus in the Tablular Display

# Test to edit Learning Journey entry from "hirefromus" to "trainfromus"
Edit Learing Journey hireformus -> trainfromus

    [Tags]    regression    edit

    LoginResources.fill the login form    ${username}    ${password}
    LearningJourneyResources.Click on the Menu Button and Click on Bussiness
    LearningJourneyResources.Click on Learning Journey from Bussiness
    LearningJourneyResources.Click on Search box and Insert Value as hirefromus
    LearningJourneyResources.Asserting the hirefromus in the Tablular Display
    LearningJourneyResources.Edititng the hirefromus into trainfromus

# Test to verify that the edit to "trainfromus" was successful
Asserting the trainfromus is changed or not
    
    [Tags]    regression    verification

    LoginResources.fill the login form    ${username}    ${password}
    LearningJourneyResources.Click on the Menu Button and Click on Bussiness
    LearningJourneyResources.Click on Learning Journey from Bussiness
    LearningJourneyResources.Click on Search box and Insert Value as hirefromus
    LearningJourneyResources.Asserting the hirefromus in the Tablular Display
    LearningJourneyResources.Edititng the hirefromus into trainfromus
    LearningJourneyResources.Assert the trainfromus in the Tablular Display

# Test to delete an entry from the Learning Journey
Deleting element from Learning Journey

    [Tags]    regression    delete    critical

    LoginResources.fill the login form    ${username}    ${password}
    LearningJourneyResources.Click on the Menu Button and Click on Bussiness
    LearningJourneyResources.Click on Learning Journey from Bussiness
    LearningJourneyResources.Asserting the hirefromus in the Tablular Display
    LearningJourneyResources.Deleting an element from the Learning Journey Table

