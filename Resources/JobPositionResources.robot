*** Settings ***
Library    SeleniumLibrary
Library    Collections
*** Variables ***
${career-path}    xpath=(//div[@class='MuiListItemText-root css-1nmt8ps'])[7]/child::span
${career-icon-path}    xpath=(//div[@class='MuiListItemIcon-root css-dcxbtk'])[7]
${job-position-path}    xpath=(//div[@class='MuiListItemText-root css-1tsvksn'])[2]/child::span
${job-pos-url}    https://smart-cliff-admin.vercel.app/Joinus-control
${job-position-icon}    xpath=(//div[@class='MuiButtonBase-root MuiListItemButton-root MuiListItemButton-gutters MuiListItemButton-root MuiListItemButton-gutters css-1clbm1r'])[2]
${add-job}    xpath=//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 MuiGrid-grid-md-6 css-1gt1d87']/child::button
${job-pos}    xpath=//input[@class='MuiInputBase-input MuiOutlinedInput-input css-1x5jdmq']
${description}    xpath=(//textarea)[1]
${form-submit}    xpath=//button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium css-1jik8rm']
${job-pos-names}    xpath=//tr[@class='MuiTableRow-root css-1gqug66']/td[1]
${job-pos-desc}    xpath=//tr[@class='MuiTableRow-root css-1gqug66']/child::td[2]
${name-job}    UI/UX designer 
${job-form-url}    https://smart-cliff-admin.vercel.app/joinus-add
${search-path}    xpath=//input[@class='MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputSizeSmall MuiInputBase-inputAdornedStart css-162edyi']
${invalid-job-name}    abcdefg
${not-found}    xpath=//td[@class='MuiTableCell-root MuiTableCell-body MuiTableCell-alignCenter MuiTableCell-sizeMedium css-1a4b21o']/child::p
${edit-icon}    xpath=(//div[@class='MuiBox-root css-1brzdu3'])[1]/child::button[1]
&{EDIT_DATA}    position=tester    position-description=Tester role updated
${del-verify}    xpath=//div[@class='MuiAlert-message css-1xsto0d']
${delete-icon}    xpath=(//button[@class='MuiButtonBase-root MuiButton-root MuiButton-outlined MuiButton-outlinedError MuiButton-sizeMedium MuiButton-outlinedSizeMedium MuiButton-root MuiButton-outlined MuiButton-outlinedError MuiButton-sizeMedium MuiButton-outlinedSizeMedium css-1h48b3'])[1]
*** Keywords ***
Click the Career option in the menu.
    Click Element    ${career-path}

Click the Career icon in the menu.
    Wait Until Element Is Visible    ${career-icon-path}    timeout=5s
    Click Element    ${career-icon-path}

Click the Job Position option under Business.
    Click Element    ${job-position-path}
    
To Verify that the "Job Position" page opens sucessfully.
    Location Should Be    ${job-pos-url}    

Click job position option under Business.
    Click Element    ${job-position-icon}
Click the Add Job Position button.
    Click Button    ${add-job}
Enter the Job Position title.
    Input Text    ${job-pos}   ${name-job} 
Enter the Job Description.
    Input Text    ${description}    Create seamless user experiences
Click the job position Submit button.
    Click Button    ${form-submit}
To verify the Job position added sucessfully
    ${elements}=    Get WebElements    ${job-pos-names}
    ${found}=    Set Variable    False
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Log To Console    ${text}
        IF    '${text}'=='${name-job}'
            ${found}=    Set Variable    True
            BREAK
        END        
    END
    Should Be True    ${found}   
Fill the Job position form with
    [Arguments]    ${Position}    ${Job-Description}
    Input Text    ${job-pos}   ${Position} 
    Input Text    ${description}    ${Job-Description}
    Click Button    ${form-submit}
Verify that the form does not submit successfully.
    Location Should Be    ${job-form-url}
Enter the Job Position in the input field.
    Input Text    ${search-path}    ${name-job}   
Verify that the entered Job Position is displayed correctly.
    ${elements}=    Get WebElements    ${job-pos-names}
    ${found}=    Set Variable    False
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Log To Console    ${text}
        IF    '${text}'=='${name-job}'
            ${found}=    Set Variable    True
            BREAK
        END        
    END
    Should Be True    ${found}
Enter an invalid job position name in the input field.
    Input Text    ${search-path}    ${invalid-job-name}
Verify that no job positions are displayed.
    Element Text Should Be    ${not-found}    No job positions found
click edit icon
    Click Button    ${edit-icon}
Update the details
    Wait Until Element Is Visible    ${job-pos}    timeout=5s
    Click Element                    ${job-pos}
    Press Keys     ${job-pos}    CTRL+A    DELETE
    Input Text    ${job-pos}    ${EDIT_DATA['position']} 

    Wait Until Element Is Visible    ${description}    timeout=5s
    Click Element                    ${description}
    Press Keys     ${description}    CTRL+A    DELETE
    Input Text    ${description}    ${EDIT_DATA['position-description']}

    Click Button    ${form-submit}

Enter the updated Job Position in the input field.
    Input Text    ${search-path}    ${EDIT_DATA['position']}
Verify that the modified position and description details is updated.
    Element Text Should Be    ${job-pos-names}    ${EDIT_DATA['position']} 
    Element Text Should Be    ${job-pos-desc}    ${EDIT_DATA['position-description']}    
To verify that the job-position should be deleted
     Element Should Be Visible    ${del-verify} 
 Click the delete icon in job positon page.
     Wait Until Element Is Visible    ${delete-icon}    timeout=5s
     Click Button    ${delete-icon}   
    