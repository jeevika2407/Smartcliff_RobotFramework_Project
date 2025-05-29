*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${menu}       xpath=(//div[@class='MuiToolbar-root MuiToolbar-gutters MuiToolbar-regular css-i6s8oy']/child::button)[1]
${business}   xpath=(//div[@class='MuiListItemText-root css-1nmt8ps']/child::span)[6]
${whyareyou}  xpath=(//div[@class='MuiList-root css-1uzmcsd']/descendant::span)[3]
${add}        xpath=//div[@class='MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 MuiGrid-grid-md-6 css-1gt1d87']/button
${title}      xpath=//div[@class='MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary MuiInputBase-fullWidth MuiInputBase-formControl css-1bp1ao6']/descendant::input
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

*** Keywords ***
Click The Menu Bar
    Wait Until Element Is Visible    ${menu}    timeout=10s
    Click Button    ${menu}

Click Option Under Menu Bar
    Wait Until Element Is Visible    ${business}    timeout=10s
    Click Element    ${business}
    Wait Until Element Is Visible    ${whyareyou}    timeout=10s
    Click Element    ${whyareyou}


Add A New Hire
    Wait Until Element Is Visible    ${add}    timeout=10s
    Scroll Element Into View         ${add}
    Click Element                    ${add}


Fill The New Hire Form
    Input Text    ${title}    txt selenium library
    Click Element    ${type}
    Click Element    ${trainUs}
    Wait Until Page Contains Element    //input[@type="file"]    timeout=10s
    Execute JavaScript    document.querySelector("input[type='file']").style.display = 'block'
    Sleep    2s
    Choose File    //input[@type="file"]    ${img}
    Sleep    5s

Click On The Add Definition
    Click Button    ${addDef}

Fill The Add Definition Form
    Input Text    ${tit}    this is description of selenium lib
    Input Text    ${textbox}    complete Robot Framework test file using the SeleniumLibrary
    Wait Until Page Contains Element    //input[@type="file"]    timeout=10s
    Execute JavaScript    document.querySelector("input[type='file']").style.display = 'block'
    Sleep    2s
    Choose File    //input[@type="file"]    ${icon}
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

