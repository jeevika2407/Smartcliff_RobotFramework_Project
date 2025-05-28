*** Settings ***
Library    SeleniumLibrary
Resource   ../Resources/GenericResources.robot
Resource   ../Resources/LoginResources.robot
Resource    ../Resources/ClientResources.robot

*** Test Cases ***
Access Client Page
    [Tags]    smoke
    Verify that the "Client" page loads successfully
Add New Client
    [Tags]    reg
    Verify that a new client can be added.
Access Clear functionality
    [Tags]    clear
    Validate 'Clear Filters' Functionality
# Search Client by Name
#     Verify the search functionality.
# Filter by Type
#     Verify that clients can be filtered by type.
# Edit Client Details
#     Verify that client details can be updated.
# Delete Client
#     Verify that a client can be deleted.

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


     
    

