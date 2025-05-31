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
${job-pos}    xpath=//div[@class='MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary MuiInputBase-fullWidth MuiInputBase-formControl css-1bp1ao6']/child::input
${description}    xpath=(//div[@class='MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary MuiInputBase-fullWidth MuiInputBase-formControl MuiInputBase-multiline css-15kq27i']/child::textarea)[1]
${form-submit}    xpath=//button[@class='MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium css-1jik8rm']
${job-pos-names}    xpath=//tr[@class='MuiTableRow-root css-1gqug66']/td[1]
${name-job}    UI/UX designer 
${job-form-url}    https://smart-cliff-admin.vercel.app/joinus-add
${search-path}    xpath=//input[@class='MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputSizeSmall MuiInputBase-inputAdornedStart css-162edyi']
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
    
    
    