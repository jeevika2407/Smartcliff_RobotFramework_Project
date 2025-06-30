*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${menu}       xpath=(//div[@class='MuiToolbar-root MuiToolbar-gutters MuiToolbar-regular css-i6s8oy']/child::button)[1]
${business}   xpath=(//div[@class='MuiListItemText-root css-1nmt8ps']/child::span)[6]
${whyareyou}  xpath=(//div[@class='MuiList-root css-1uzmcsd']/descendant::span)[3]
${add}        xpath=//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 MuiGrid-grid-md-6 css-1gt1d87']/button
${title}      xpath=(//div[@class='MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary MuiInputBase-fullWidth MuiInputBase-formControl css-1bp1ao6']/descendant::input)[1]
${type}       xpath=//div[@class='MuiSelect-select MuiSelect-outlined MuiInputBase-input MuiOutlinedInput-input css-qiwgdb']
${trainUs}    xpath=(//li[@class='MuiButtonBase-root MuiMenuItem-root MuiMenuItem-gutters MuiMenuItem-root MuiMenuItem-gutters css-1km1ehz']/following-sibling::li)[1]
${img}        ${CURDIR}${/}sampleFile.jpeg
${addDef}     xpath=//div[@class='MuiStack-root css-95g4uk']/button
${tit}        xpath=(//div[@class='MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary MuiInputBase-fullWidth MuiInputBase-formControl css-1bp1ao6']/input)[2]
${textbox}    xpath=(//div/textarea)[3]
${icon}       ${CURDIR}${/}colorIcon.png
${create}     xpath=//div[@class='MuiBox-root css-1vfa8p7']/button
${actual-name-list}    xpath=//tr[@class='MuiTableRow-root css-1gqug66']/td[2]
${search-name}  xpath=//div[@class='MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary MuiInputBase-fullWidth MuiInputBase-formControl MuiInputBase-sizeSmall MuiInputBase-adornedStart css-2xhzvc']/descendant::input
${name}    txt
${name1}    robot
${business_icon}    xpath=//*[@class="MuiList-root MuiList-padding css-1ontqvh"]//child::li[6]
${wcy_icon}    xpath=//*[@id="drawer"]/div/ul/li[6]/div[2]/div/div/div/div[2]
${edit}    xpath=(//table//tbody//button)[1]
${update}    xpath=//div[@class='MuiBox-root css-1vfa8p7']/button
${updated-name}    txt robot framework
${up_tit}    xpath=(//div[@class='MuiCardContent-root css-1qw96cp']/preceding::input)[1]
${def-tit}    xpath=((//div[@class='MuiBox-root css-1coeexk']/parent::div/preceding-sibling::div)[2]/child::div)[1]/child::div/child::input
${deleteIcon}    xpath=(//table//tbody//td//button)[2]
${confirmDelete}    xpath=//div[@class='MuiDialogActions-root MuiDialogActions-spacing css-33pgcr']//button[2]
${noEntryMSg}    xpath=//*[@id="root"]/div[1]/main/div[2]/div[2]/table/tbody/tr/td
${back}    xpath=//div[@class='MuiBox-root css-1dfbuxp']/descendant::button
${url}    xpath=https://smart-cliff-admin.vercel.app/business/wcy-hire-control
${tit2}    xpath=(//div[@class='MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary MuiInputBase-fullWidth MuiInputBase-formControl css-1bp1ao6']/input)[3]
${textbox2}    xpath=(//div/textarea)[5]

*** Keywords ***
Click The Menu Bar
    Wait Until Element Is Visible    ${menu}    timeout=10s
    Click Button    ${menu}

Click Option Under Menu Bar
    Wait Until Element Is Visible    ${business}    timeout=10s
    Click Element    ${business}
    Wait Until Element Is Visible    ${whyareyou}    timeout=10s
    Click Element    ${whyareyou}

Click icon of business under menu icon
    Wait Until Element Is Visible    ${business}    timeout=10s
    Click Element    ${business_icon}
    Wait Until Element Is Visible    ${whyareyou}    timeout=10s
    Click Element    ${wcy_icon}

Add A New Hire
    Wait Until Element Is Visible    ${add}    timeout=10s
    Scroll Element Into View         ${add}
    Click Element                    ${add}


Fill The New Hire Form
    Choose File    xpath=(//input[@type='file'])[1]    ${img}
    Input Text    ${title}    txt
    Click Element    ${type}
    Click Element    ${trainUs}
    Sleep    5s
    
Click On The Add Definition
    Click Button    ${addDef}

Fill The Add Definition Form
    Choose File    xpath=(//input[@type='file'])[2]    ${icon}
    Input Text    ${tit}    this is description of selenium lib
    Input Text    ${textbox}    complete Robot Framework test file using the SeleniumLibrary
    Sleep    5s

Click On Create
    Click Button    ${create}
    Sleep    2s

Check If Name Exists In Filtered List
    [Arguments]    ${name}
    ${elements}=    Get WebElements    ${actual-name-list}
    ${found}=       Set Variable    False
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Log To Console    ${text}
        IF    '${text}' == '${name}'
            ${found}=    Set Variable    True
            BREAK
        END
    END
    Should Be True    ${found}    msg=Name '${name}' not found in the list!

Enter a name in the input field.
    Input Text    ${search-name}    ${name}

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

Click On Edit Button
    Wait Until Element Is Visible    ${edit}    timeout=10s
    Click Button    ${edit}

Change The Name Of The Title
    Wait Until Element Is Visible    ${up_tit}    10s
    Click Element    ${up_tit}
    Press Keys    ${up_tit}    CTRL+A    DELETE
    Sleep    1s
    Input Text    ${up_tit}    ${updated-name}


    Wait Until Element Is Visible    ${def-tit}    10s
    Click Element    ${def-tit}
    Press Keys    ${def-tit}    CTRL+A    DELETE
    Sleep    1s
    Input Text    ${def-tit}    new change made

Enter The Update Button
    Wait Until Element Is Visible    ${update}    timeout=10s
    Click Button    ${update}
    Sleep    2s

Verify That The Modified Title Is Listed In The Search
    Input Text    ${search-name}    ${updated-name}
    Page Should Contain    ${updated-name}


Fill The New Hire Form2
    Choose File    xpath=(//input[@type='file'])[1]    ${img}
    Input Text    ${title}    java
    Click Element    ${type}
    Click Element    ${trainUs}
    Sleep    5s

Search The Item
    Input Text    ${search-name}    java

Click On The Delete Icon
    Click Button    ${deleteIcon}

Click On Confirm Delete
    Click Button    ${confirmDelete}
    Sleep    5s

Verify Item Is Deleted
    ${text}=    Get Text    ${noEntryMSg}
    Should Be Equal    ${text}    No entries found

Click on back button
    Click Button    ${back}
    Sleep    5s

Check back button is navigated to previous page
    ${url1}=    Get Location
    Log    Navigated URL after first back click: ${url1}
    Should Contain    ${url1}    wcy-hire-control

Fill The Add Definition Form1
    Choose File    xpath=(//input[@type='file'])[2]    ${icon}
    Input Text    ${tit}    this is description of selenium lib
    Input Text    ${textbox}    complete Robot Framework test file using the SeleniumLibrary
    Sleep    10s

Again click on add definition
    Click Button    ${addDef}

Fill The Add Definition Form2
    Choose File    xpath=(//input[@type='file'])[3]    ${icon}
    Input Text    ${tit2}    this is description of selenium lib
    Input Text    ${textbox2}    complete Robot Framework test file using the SeleniumLibrary
    Sleep    5s

    