*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${menu}    xpath=//div[@class='MuiToolbar-root MuiToolbar-gutters MuiToolbar-regular css-i6s8oy']/child::button[1]
${business}    xpath=(//li[@class='MuiListItem-root MuiListItem-gutters css-bkmufr'])[6]/child::div
${client}    xpath=(//div[@class='MuiListItemText-root css-1tsvksn'])[4]/child::span
${client-icon}    xpath=(//div[@class='MuiListItemIcon-root css-fj0vgj'])[4]
${client-url}    https://smart-cliff-admin.vercel.app/business/Client-control
${add}    xpath=(//button)[5]
${type-dropdown}    xpath=//div[@role='combobox']
${type}    xpath=//li[@class='MuiButtonBase-root MuiMenuItem-root MuiMenuItem-gutters MuiMenuItem-root MuiMenuItem-gutters css-1km1ehz'][3]
${image}    xpath=//*[@class='MuiDropzoneArea-root']
${image-path}    ${CURDIR}${/}bookmyshow.png
${client-name}    xpath=//input[@id='name']
${name}    Jeevika
${submit}    xpath=//button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-fullWidth MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-fullWidth css-986jpq']
${actual-name-list}    xpath=//tr/child::td[@class='MuiTableCell-root MuiTableCell-body MuiTableCell-sizeMedium css-q34dxg']
${search-name}    xpath=//div[@class='MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary MuiInputBase-fullWidth MuiInputBase-formControl MuiInputBase-sizeSmall MuiInputBase-adornedStart css-2xhzvc']/child::input
${clear}    xpath=//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-xs-6 MuiGrid-grid-md-3 css-18tn63a']/child::button
${train_from_us}    xpath=//ul[@class='MuiList-root MuiList-padding MuiMenu-list css-r8u8y9']/li[2]
${institute}    xpath=//ul[@class='MuiList-root MuiList-padding MuiMenu-list css-r8u8y9']/li[3]
${home}    xpath=//ul[@class='MuiList-root MuiList-padding MuiMenu-list css-r8u8y9']/li[4]
${choose-filter}    xpath=//div[@id='type-filter']
${filter-list}    xpath=//span[@class='MuiChip-label MuiChip-labelMedium css-11lqbxm']
${edit-icon}    xpath=(//div[@class='MuiBox-root css-1brzdu3']/child::button)[1]
${new-name}    Keerthana
${update}    xpath=//button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium css-1r5h9n8']
${verify-name}    xpath=(//tr[@class='MuiTableRow-root css-1gqug66']/td)[1]
${del-icon}    xpath=(//button[//*[local-name()='svg']])[9]
${del-confirm}    xpath=//button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedError MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-root MuiButton-contained MuiButton-containedError MuiButton-sizeMedium MuiButton-containedSizeMedium css-1ecefdc']
${del-verify}    xpath=//div[@class='MuiAlert-message css-1xsto0d']
${invalid-name-err}    xpath=//p[@class='MuiFormHelperText-root Mui-error MuiFormHelperText-sizeMedium MuiFormHelperText-contained MuiFormHelperText-filled Mui-required css-v7esy']
${img-required-err}    xpath=//div[@class='MuiAlert-message css-1xsto0d']
${back-but}    xpath=//div[@class='MuiBox-root css-1dfbuxp']/child::button
${invalid-name}    abcdefgh
${invalid-search-name-ver}    xpath=//td[@class='MuiTableCell-root MuiTableCell-body MuiTableCell-alignCenter MuiTableCell-sizeMedium css-1a4b21o']/child::p
*** Keywords ***
Click the menu button to open the sidebar.
    Wait Until Element Is Visible    ${menu}    timeout=10s
    Click Button    ${menu}
Click the Business option in the menu.
    Wait Until Element Is Visible    ${business}    timeout=10s
    Click Element    ${business}
Click the Client option under Business.
    Click Element    ${client}
To Verify that the "Client" page opens sucessfully.
    Location Should Be    ${client-url}

Click the Add New Client button.
    Click Button    ${add}
Click the Type dropdown.
    Click Element    ${type-dropdown}    
Select Institute from the dropdown.
    Click Element    ${type}

Upload an image in the drag and drop area.
    Sleep    1s
    Choose File    //input[@type="file"]    ${image-path}

Enter the client name in the input field. 
    Input Text    ${client-name}    ${name}    

Click the Submit button.
    Wait Until Element Is Visible    ${submit}    timeout=10s
    Click Button    ${submit}
    Sleep    5s

To verify the new client added.    
    ${elements}=    Get WebElements    ${actual-name-list}
    ${found}=    Set Variable    False
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Log To Console    ${text}
        IF    '${text}'=='${name}'
            ${found}=    Set Variable    True
            BREAK
        END        
    END
    Should Be True    ${found}

Enter a name in the input field.
    Input Text    ${search-name}    ${name}

Click the 'Clear' button
    Click Button    ${clear}

verify that the filter is removed correctly.
    Element Should Not Contain    ${search-name}    ${name}

The entered name should be displayed in the filter section below.
    ${elements}=    Get WebElements    ${actual-name-list}
    ${found}=    Set Variable    False
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Log To Console    ${text}
        IF    '${text}'=='${name}'
            ${found}=    Set Variable    True
            BREAK
        END        
    END
    Should Be True    ${found}

The user selects a specific type.
    Click Element    ${choose-filter}

Verify that the corresponding items are displayed below.
    [Arguments]    ${Filtertype}
    Log To Console    ${Filtertype}
    
    IF    '${Filtertype}' == 'Train From Us'
        Wait Until Element Is Visible    ${train_from_us}    timeout=10
        Click Element    ${train_from_us}
        ${elements}=    Get WebElements    ${filter-list}
        ${length}=    Get Length    ${elements}
        IF    ${length} == 0
            Log To Console    No elements present
        ELSE
            ${found}=    Set Variable    True
            FOR    ${element}    IN    @{elements}
            ${text}=    Get Text    ${element}
                IF    '${text}'!='Train From Us'
                    ${found}=    Set Variable    False
                    BREAK
                END   
                Should Be True    ${found}
            END
        END
    END
    IF    '${Filtertype}' == 'Institute'
        Wait Until Element Is Visible    ${institute}    timeout=10
        Click Element    ${institute}
        ${elements}=    Get WebElements    ${filter-list}
        ${found}=    Set Variable    True
        FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
            IF    '${text}'!='Institute'
                ${found}=    Set Variable    False
                BREAK
            END   
            Should Be True    ${found}
        END
    END      
    IF    '${Filtertype}' == 'Home'
        Wait Until Element Is Visible    ${home}    timeout=10
        Click Element    ${home}
        ${elements}=    Get WebElements    ${filter-list}
        ${length}=    Get Length    ${elements}
        IF    ${length} == 0
            Log To Console    No elements present
        ELSE
            ${found}=    Set Variable    True
            FOR    ${element}    IN    @{elements}
            ${text}=    Get Text    ${element}
                IF    '${text}'!='Home'
                    ${found}=    Set Variable    False
                    BREAK
                END   
                Should Be True    ${found}
            END
        END
    END 


Click the edit icon.
    Click Button    ${edit-icon}

Change the name of the client
    Wait Until Element Is Visible    ${client-name}    timeout=5s
    Click Element                    ${client-name}
    Press Keys     ${client-name}    CTRL+A    DELETE
    Input Text    ${client-name}    ${new-name}

Click the Update button.
    Click Button    ${update}

Enter a updated name in the input field.
    Input Text    ${search-name}    ${new-name}

Verify that the modified name is updated to the client.
    Element Text Should Be    ${verify-name}    ${new-name}
    
Click the delete icon.
    Click Button    ${del-icon}
Click the confirm button to proceed with the deletion.
    Click Button    ${del-confirm}
 Click the Client icon under Business.
     Click Element    ${client-icon}
To verify that the client should be deleted
    Element Should Be Visible    ${del-verify}
    
Enter the invalid name
    [Arguments]    ${invalid-name}
    Input Text    ${client-name}    ${invalid-name}
To verify the error message displayed in the name field.
    Element Text Should Be    ${invalid-name-err}    Name must contain only alphabets
To verify the error message displayed in the image field.
    Page Should Contain   Image is required
Click the back button
    Wait Until Element Is Visible    ${back-but}    timeout=5s
    Click Button    ${back-but}
To verify that it navigates to the client panel page.
    Location Should Be    ${client-url}    
Enter a invalid-name in the input field.
    Input Text    ${search-name}    ${invalid-name}
To verify that no records are found in the client list.
    Element Text Should Be    ${invalid-search-name-ver}    No entries found

