*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${threelines}    xpath = (//*[@class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-vubbuv"])[1]
${Career}    xpath = //*[@class="MuiList-root MuiList-padding css-1ontqvh"]//child::li[7]
${CareerPage}    xpath = (//*[@class="MuiList-root css-1uzmcsd"]//child::div[1])[1]
${CareerPageTitle}    xpath = //*[@class="MuiBox-root css-19kzrtu"]//child::h4
${AddNewCareer}    xpath = //*[@class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 MuiGrid-grid-md-6 css-1gt1d87"]//child::button
${BackButton}    xpath = //*[@class="MuiBox-root css-1dfbuxp"]//child::button
${Title_path}    xpath = (//*[@class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary MuiInputBase-fullWidth MuiInputBase-formControl css-1bp1ao6"]//input)[1]
${Description}    xpath = (//*[@class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary MuiInputBase-fullWidth MuiInputBase-formControl MuiInputBase-multiline css-15kq27i"]//child::textarea)[1]
${Subtitle}    xpath = (//*[@class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary MuiInputBase-fullWidth MuiInputBase-formControl css-1bp1ao6"]//child::input)[2]
${Sub-Description}    xpath = (//*[@class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary MuiInputBase-fullWidth MuiInputBase-formControl MuiInputBase-multiline css-15kq27i"])[2]//textarea[1]
${Image-uplode}    xpath = //*[@class="MuiCardContent-root css-1qw96cp"]//child::label
${IMAGE_PATH}    ${CURDIR}${/}samplepic.jpg
${count}    xpath = //*[@class="MuiTableBody-root css-1xnox0e"]//tr
${Create}    xpath = //*[@class="MuiBox-root css-1vfa8p7"]//child::button
${delete_icon1}    xpath = (//*[@class="MuiTableCell-root MuiTableCell-body MuiTableCell-alignRight MuiTableCell-sizeMedium css-1i36psw"]//button)[2]
${delete_button1}    xpath = //*[@class="MuiDialogActions-root MuiDialogActions-spacing css-33pgcr"]//child::button[2]//span
${Edit_button1}    xpath = (//*[@class="MuiTableCell-root MuiTableCell-body MuiTableCell-alignRight MuiTableCell-sizeMedium css-1i36psw"]//child::button[1])[last()]
${update_button1}    xpath = //*[@class="MuiBox-root css-1vfa8p7"]//child::button
${Edit_chec2}    ((//*[@class="MuiTableRow-root css-1gqug66"])//child::td[1])[last()]
${link}    xpath = (//*[@class="MuiInputBase-input MuiOutlinedInput-input css-1x5jdmq"])[1]
${search_Box1}    xpath = //*[@class="MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputSizeSmall MuiInputBase-inputAdornedStart css-162edyi"]
${search_element1}    xpath = //*[@class="MuiTypography-root MuiTypography-body1 css-9l3uo3"]
${table_value1}    xpath = //*[@class="MuiTableBody-root css-1xnox0e"]
${cancle_button1}  xpath = //*[@class="MuiButtonBase-root MuiButton-root MuiButton-outlined MuiButton-outlinedPrimary MuiButton-sizeMedium MuiButton-outlinedSizeMedium MuiButton-root MuiButton-outlined MuiButton-outlinedPrimary MuiButton-sizeMedium MuiButton-outlinedSizeMedium css-n81xtf"]

*** Keywords ***
User visit the Career Page By clicking on the three lines icon
    Click Element    ${threelines}
    Click Element    ${Career}
    Click Element    ${CareerPage}
    Element Should Be Visible    ${CareerPageTitle}
User visit the Career Page By clicking icon
    Click Element    ${Career}
    Click Element    ${CareerPage}
    Element Should Be Visible    ${CareerPageTitle}
User will visit the Career Page By clicking Back which is in the Add New Career Page
    Click Element    ${Career}
    Click Element    ${CareerPage}
    Click Element    ${AddNewCareer}
    CLick Element    ${BackButton}
    Element Should Be Visible    ${CareerPageTitle}
Add New Career with Valid Data
    [Arguments]    ${Heading}    ${Description_name}    ${SubHeading}    ${SubDescription}
    Click Element    ${Career}
    Click Element    ${CareerPage}
    Click Element    ${AddNewCareer}
    ${row_count}=    Get Element Count    ${count}
    Wait Until Element Is Visible    ${Title_path}    timeout=10s
    Execute JavaScript    document.querySelector("input[type='file']").style.display = 'block'
    Choose File    //input[@type="file"]    ${IMAGE_PATH}
    Input Text    ${Title_path}    ${Heading}
    Input Text    ${Description}    ${Description_name}
    Input Text    ${Subtitle}    ${SubHeading}
    Input Text    ${Sub-Description}    ${SubDescription}
    Click Element    ${Create}
    Wait Until Element Is Visible    ${count}    timeout=20s
    ${row_count1}=    Get Element Count    ${count}
    Should Not Be Equal    ${row_count}    ${row_count1}

Add New Career with Invalid Data
    [Arguments]    ${Heading}    ${Description_name}    ${SubHeading}    ${SubDescription}
    ${initial_url}=    Get Location
    Click Element    ${Career}
    Click Element    ${CareerPage}
    Click Element    ${AddNewCareer}
    Wait Until Element Is Visible    ${Title_path}    timeout=10s
    Execute JavaScript    document.querySelector("input[type='file']").style.display = 'block'
    Choose File    //input[@type="file"]    ${IMAGE_PATH}
    Input Text    ${Title_path}    ${Heading}
    Input Text    ${Description}    ${Description_name}
    Input Text    ${Subtitle}    ${SubHeading}
    Input Text    ${Sub-Description}    ${SubDescription}
    Click Element    ${Create}
    Sleep    5
    ${current_url}=    Get Location
    Should Not Be Equal    ${initial_url}    ${current_url}

Search Career Valid Data
    [Arguments]    ${search_text}
    Input Text    ${search_Box1}    ${search_text}
    Sleep    2s
    Page Should Contain Element    ${table_value1}

Search Career Invalid Data
    [Arguments]    ${search_text}
    Input Text    ${search_Box1}    ${search_text}
    Sleep    2s
    Page Should Contain Element    ${search_element1}

delete Career
    ${before_text}=    Get Text    //*[@class="MuiTablePagination-displayedRows css-1chpzqh"]
    Click Element    ${delete_icon1}
    Click Element    xpath=//*[@class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedError MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-root MuiButton-contained MuiButton-containedError MuiButton-sizeMedium MuiButton-containedSizeMedium css-1ecefdc"]
    # Wait Until Element Is Visible    ${count}    timeout=10s
    sleep    2s
    ${after_text}=    Get Text    //*[@class="MuiTablePagination-displayedRows css-1chpzqh"]
    Should Not Be Equal    ${before_text}    ${after_text}

Edit How It Work
    [Arguments]    ${Titless}
    Click Element    ${Edit_button1}
    Wait Until Element Is Visible    ${link}    timeout=10s
    Press Keys    ${link}   CTRL+A    DELETE
    sleep    2
    Input Text    ${link}    ${Titless}
    Click Element    ${update_button1}
    Wait Until Element Is Visible    ${count}    timeout=10s
    ${Edit_element_locator}=    Get Text    ${Edit_chec2}
    Should Be Equal    ${Titless}    ${Edit_element_locator}
Delete Cancel Button
    ${initial_url}=    Get Location
    Click Element    ${delete_icon1}
    Click Element    ${cancle_button1}
    ${current_url}=    Get Location
    Should Be Equal    ${initial_url}    ${current_url}