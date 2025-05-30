*** Settings ***
Documentation    Learning Journey Test Cases for Smartcliff Admin Website to Edit and Delete
Library    SeleniumLibrary
Resource         ../Resources/LoginResources.robot
Resource         ../Resources/GenericResources.robot
Resource         ../Resources/LearningJourneyResources.robot
Test Setup       Open the browser with url
Test Teardown    Close the browser session

*** Test Cases ***

Login and Navigate to Learning Journey

    LoginResources.fill the login form    ${username}    ${password}
    LearningJourneyResources.Click on the Menu Button and Click on Bussiness
    LearningJourneyResources.Click on Learning Journey from Bussiness
    LearningJourneyResources.Click on Search box and Insert Value as hirefromus

Assert hirefromus in the Tablular Display

    LoginResources.fill the login form    ${username}    ${password}
    LearningJourneyResources.Click on the Menu Button and Click on Bussiness
    LearningJourneyResources.Click on Learning Journey from Bussiness
    LearningJourneyResources.Click on Search box and Insert Value as hirefromus
    LearningJourneyResources.Asserting the hirefromus in the Tablular Display

Edit Learing Journey hireformus -> trainfromus

    LoginResources.fill the login form    ${username}    ${password}
    LearningJourneyResources.Click on the Menu Button and Click on Bussiness
    LearningJourneyResources.Click on Learning Journey from Bussiness
    LearningJourneyResources.Click on Search box and Insert Value as hirefromus
    LearningJourneyResources.Asserting the hirefromus in the Tablular Display
    LearningJourneyResources.Edititng the hirefromus into trainfromus

Asserting the trainfromus is changed or not
    
    LoginResources.fill the login form    ${username}    ${password}
    LearningJourneyResources.Click on the Menu Button and Click on Bussiness
    LearningJourneyResources.Click on Learning Journey from Bussiness
    LearningJourneyResources.Click on Search box and Insert Value as hirefromus
    LearningJourneyResources.Asserting the hirefromus in the Tablular Display
    LearningJourneyResources.Edititng the hirefromus into trainfromus
    LearningJourneyResources.Assert the trainfromus in the Tablular Display

Deleting element from Learning Journey

    LoginResources.fill the login form    ${username}    ${password}
    LearningJourneyResources.Click on the Menu Button and Click on Bussiness
    LearningJourneyResources.Click on Learning Journey from Bussiness
    LearningJourneyResources.Asserting the hirefromus in the Tablular Display
    LearningJourneyResources.Deleting an element from the Learning Journey Table

