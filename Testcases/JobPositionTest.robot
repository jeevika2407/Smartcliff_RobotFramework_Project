*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/GenericResources.robot
Resource   ../Resources/LoginResources.robot
Resource    ../Resources/JobPositionResources.robot
Resource    ../Resources/ClientResources.robot  #for menu clicking
Library    DataDriver   file=../Utility/JobPositiondata.xlsx    sheet_name=Sheet1
Test Teardown       Close the browser session

***Variables***
${email}    smart@gmail.com
${password}    1234
${Position}
${Job-Description}
*** Test Cases ***
Access Job Position Control page
    [Tags]    smoke    job
    Verify that the "Job Position control" page loads successfully

Access Job Position Page By clicking icon
    [Tags]    smoke    job 
    Verify that the "Job Position control" page loads successfully By clicking icons

Add Job Position
    [Tags]    smoke    job1 
    Verify that a new job position can be added.
 Add a New Job-position with empty input
     [Tags]    smoke    job   
     [Template]     To verify the Add functionality to provide a empty input
     ${Position}    ${Job-Description}
Search Job-position by Name
    [Tags]    smoke    job
    Verify the search functionality in the Job-Position control page.
Search Job-position by invalid-Name
    [Tags]    smoke    job
    Verify the search functionality with providing the invalid name
Edit Job-Position Details
    [Tags]    smoke    job
    To verify Update Job-Position Details After Editing
Delete Job-Position
    [Tags]    smoke    job
    Verify that a Job-Position can be deleted.

*** Keywords ***

Verify that the "Job Position control" page loads successfully
    Open the browser with url
    fill the login form    ${email}    ${password}
    Click the menu button to open the sidebar.
    Click the Career option in the menu.
    Click the Job Position option under Business.
    To Verify that the "Job Position" page opens sucessfully.

    
Verify that the "Job Position control" page loads successfully By clicking icons
    Open the browser with url
    fill the login form    ${email}    ${password}
    Click the Career icon in the menu.
    Click job position option under Business.
    To Verify that the "Job Position" page opens sucessfully.

Verify that a new job position can be added.
    Open the browser with url
    fill the login form    ${email}    ${password}
    Click the menu button to open the sidebar.
    Click the Career option in the menu.
    Click the Job Position option under Business.
    Click the Add Job Position button.
    Enter the Job Position title.
    Enter the Job Description.
    Click the job position Submit button.
    Enter the Job Position in the input field.
    To verify the Job position added sucessfully
To verify the Add functionality to provide a empty input
    [Arguments]    ${Position}    ${Job-Description}
    Open the browser with url
    fill the login form    ${email}    ${password}
    Click the menu button to open the sidebar.
    Click the Career option in the menu.
    Click the Job Position option under Business.
    Click the Add Job Position button.
    Fill the Job position form with   ${Position}    ${Job-Description}
    Verify that the form does not submit successfully.
Verify the search functionality in the Job-Position control page.
    Open the browser with url
    fill the login form    ${email}    ${password}
    Click the menu button to open the sidebar.
    Click the Career option in the menu.
    Click the Job Position option under Business.
    Enter the Job Position in the input field.
    Verify that the entered Job Position is displayed correctly.
Verify the search functionality with providing the invalid name
    Open the browser with url
    fill the login form    ${email}    ${password}
    Click the menu button to open the sidebar.
    Click the Career option in the menu.
    Click the Job Position option under Business.
    Enter an invalid job position name in the input field.
    Verify that no job positions are displayed.
To verify Update Job-Position Details After Editing
    Open the browser with url
    fill the login form    ${email}    ${password}
    Click the menu button to open the sidebar.
    Click the Career option in the menu.
    Click the Job Position option under Business.
    Enter the Job Position in the input field.
    click edit icon
    Update the details
    Enter the updated Job Position in the input field.
    Verify that the modified position and description details is updated.
Verify that a Job-Position can be deleted.
    Open the browser with url
    fill the login form    ${email}    ${password}
    Click the menu button to open the sidebar.
    Click the Career option in the menu.
    Click the Job Position option under Business.
    Click the Add Job Position button.
    Enter the Job Position title.
    Enter the Job Description.
    Click the job position Submit button.
    Enter the Job Position in the input field.
    Click the delete icon in job positon page.
    Click the confirm button to proceed with the deletion.
    To verify that the job-position should be deleted
    
       