*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/GenericResources.robot
Resource   ../Resources/LoginResources.robot
Resource    ../Resources/ClientResources.robot
Library    DataDriver    file=../Utility/Filterdata.csv    encoding=utf_8    dialect=unix

* Variables *
${Filtertype}

*** Test Cases ***

Access Client Page
    [Tags]    smoke    client
    Verify that the "Client" page loads successfully
Add New Client
    [Tags]    smoke    client 
    Verify that a new client can be added.
Access Clear functionality
    [Tags]    smoke    client
    Validate 'Clear Filters' Functionality
Search Client by Name
    [Tags]    smoke    client
    Verify the search functionality.
Filter by Type
     [Tags]    smoke    client
     [Template]    Verify that clients can be filtered by type.
     ${Filtertype}
Edit Client Details
    [Tags]    regrsseion    client
    To verify Update Client Details After Editing
Delete Client
    [Tags]    regression    client
    Verify that a client can be deleted.

*** Keywords ***

Verify that the "Client" page loads successfully
    Open the browser with url
    fill the login form    smart@gmail.com    1234
    Click the menu button to open the sidebar.
    Click the Business option in the menu.
    Click the Client option under Business.
    To Verify that the "Client" page.
 
Verify that a new client can be added.
    Open the browser with url
    fill the login form    smart@gmail.com    1234
    Click the menu button to open the sidebar.
    Click the Business option in the menu.
    Click the Client option under Business.
    Click the Add New Client button.
    Click the Type dropdown.
    Select Institute from the dropdown.
    Enter the client name in the input field.
    Upload an image in the drag and drop area.
    Click the Submit button.
    To verify the new client added.   
Validate 'Clear Filters' Functionality
    Open the browser with url
    fill the login form    smart@gmail.com    1234
    Click the menu button to open the sidebar.
    Click the Business option in the menu.
    Click the Client option under Business.
    Enter a name in the input field.
    Click the 'Clear' button
    verify that the filter is removed correctly.

Verify the search functionality.
    Open the browser with url
    fill the login form    smart@gmail.com    1234
    Click the menu button to open the sidebar.
    Click the Business option in the menu.
    Click the Client option under Business.
    Enter a name in the input field.
    The entered name should be displayed in the filter section below.
    
Verify that clients can be filtered by type.
    [Arguments]    ${Filtertype}
    Open the browser with url
    fill the login form    smart@gmail.com    1234
    Click the menu button to open the sidebar.
    Click the Business option in the menu.
    Click the Client option under Business.
    The user selects a specific type.    
    Verify that the corresponding items are displayed below.    ${Filtertype}
    
To verify Update Client Details After Editing
    Open the browser with url 
    fill the login form    smart@gmail.com    1234
    Click the menu button to open the sidebar.
    Click the Business option in the menu.
    Click the Client option under Business.
    Enter a name in the input field.
    Click the edit icon.
    Change the name of the client
    Click the Update button.
    Enter a updated name in the input field.
    Verify that the modified name is updated to the client.
    
Verify that a client can be deleted.
    Open the browser with url    
    fill the login form    smart@gmail.com    1234
    Click the menu button to open the sidebar.
    Click the Business option in the menu.
    Click the Client option under Business.
    Enter a name in the input field.
    Click the delete icon.
    Click the confirm button to proceed with the deletion.
    
    
    

