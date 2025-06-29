*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${threelines}    xpath = (//*[@class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-vubbuv"])[1]
${Bussiness}    xpath = //*[@class="MuiList-root MuiList-padding css-1ontqvh"]//child::li[6]
${HowItWork}    xpath = //*[@class="MuiList-root MuiList-padding css-1ontqvh"]//child::li[6]//div[3]
${HowItWorkPage}    xpath = //*[@class="MuiTypography-root MuiTypography-h4 css-1oijgnj"]
${count}    xpath = //*[@class="MuiTableBody-root css-1xnox0e"]//tr
${AddNer}    xpath = //*[@class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 MuiGrid-grid-md-6 css-1gt1d87"]//child::button
${Title-path}    xpath = //*[@class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary MuiInputBase-fullWidth MuiInputBase-formControl css-1bp1ao6"]//input
${Description}    xpath = //*[@class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary MuiInputBase-fullWidth MuiInputBase-formControl MuiInputBase-multiline css-15kq27i"]//textarea
${TYPE}    xpath =//*[@class="MuiInputBase-root MuiOutlinedInput-root MuiInputBase-colorPrimary MuiInputBase-formControl css-fvipm8"]
${Train_From_Us}    xpath = (//*[@class="MuiButtonBase-root MuiMenuItem-root MuiMenuItem-gutters MuiMenuItem-root MuiMenuItem-gutters css-1km1ehz"])[2]
${DROPZONE_AREA}    xpath://*[@class="MuiDropzoneArea-root"]
${submit}    xpath = //*[@class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-fullWidth MuiButton-root MuiButton-contained MuiButton-containedPrimary MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-fullWidth css-1qelgoy"]
${IMAGE_PATH}    ${CURDIR}${/}samplepic.jpg
${search_Box}    xpath = //input[@class="MuiInputBase-input MuiOutlinedInput-input MuiInputBase-inputSizeSmall MuiInputBase-inputAdornedStart css-162edyi"]
${search_element}    xpath = //*[@class="MuiTable-root css-1owb465"]//child :: tbody
${wrong_search_element}    xpath = //*[@class="MuiBox-root css-dvxtzn"]//child::h6
${delete_icon}    xpath = (//*[@class="MuiBox-root css-1i27l4i"]//child::button[2])[last()]
${delete_button}    xpath = //*[@class="MuiDialogActions-root MuiDialogActions-spacing css-33pgcr"]//child::button[2]
${Edit_button}    xpath = (//*[@class="MuiBox-root css-1i27l4i"]//button[1])[last()]
${Edit_checl}   xpath = (//*[@class="MuiTableBody-root css-1xnox0e"]//child::td[1]//p)[last()]
${update_button}    xpath = (//*[@style="border: 2px dotted rgb(211, 211, 211); padding: 20px; border-radius: 8px;"]//child::button)[2]
${title1}   xpath = (//*[@style="border: 2px dotted rgb(211, 211, 211); padding: 20px; border-radius: 8px;"]//child::div[1]//input)[1]
${drop_down}    xpath = //*[@class="MuiSelect-select MuiTablePagination-select MuiSelect-standard MuiInputBase-input css-1cccqvr"]
${num_of_stacks}    xpath = //*[@class="MuiTableBody-root css-1xnox0e"]//tr
${Cancle_button}    xpath = //button[@class="MuiButtonBase-root MuiButton-root MuiButton-outlined MuiButton-outlinedPrimary MuiButton-sizeMedium MuiButton-outlinedSizeMedium MuiButton-root MuiButton-outlined MuiButton-outlinedPrimary MuiButton-sizeMedium MuiButton-outlinedSizeMedium css-n81xtf"]

&{drop_down_options}    
...    5=(//*[@class="MuiButtonBase-root MuiMenuItem-root MuiMenuItem-gutters MuiMenuItem-root MuiMenuItem-gutters MuiTablePagination-menuItem css-1gs62wq"])[1]
...    10=(//*[@class="MuiButtonBase-root MuiMenuItem-root MuiMenuItem-gutters MuiMenuItem-root MuiMenuItem-gutters MuiTablePagination-menuItem css-1gs62wq"])[2]
...    25=(//*[@class="MuiButtonBase-root MuiMenuItem-root MuiMenuItem-gutters MuiMenuItem-root MuiMenuItem-gutters MuiTablePagination-menuItem css-1gs62wq"])[3]

*** Keywords ***
User visit the How It Work page By clicking on the three lines icon
    Click Element    ${threelines}
    Click Element    ${Bussiness}
    Click Element    ${HowItWork}
    Element Should Be Visible    ${HowItWorkPage}
User visit the How It Work page By clicking icon
    Click Element    ${Bussiness}
    Click Element    ${HowItWork}
    Element Should Be Visible    ${HowItWorkPage}
Add New How It Work with Valid Data
    [Arguments]    ${Heading}    ${Descriptions}
    ${row_count}=    Get Element Count    ${count}
    Click Element    ${AddNer}
    Click Element    ${DROPZONE_AREA}
    Sleep    1
    ${file_input}=    Set Variable    css:input[type="file"][accept="image/*"]
    Choose File    ${file_input}    ${IMAGE_PATH}
    Input Text    ${Title-path}    ${Heading}
    Input Text    ${Description}    ${Descriptions}      
    Click Element    ${TYPE}
    Click Element    ${Train_From_Us}
    Click Element    ${submit}
    Wait Until Element Is Visible    ${count}    timeout=20s
    ${row_count1}=    Get Element Count    ${count}
    Should Not Be Equal    ${row_count}    ${row_count1}

Add New How It Work with Invalid Data
    [Arguments]    ${Heading}    ${Description_name}
    ${row_count}=    Get Element Count    ${count}
    ${initial_url}=    Get Location
    Click Element    ${AddNer}
    Click Element    ${DROPZONE_AREA}
    Sleep    1
    ${file_input}=    Set Variable    css:input[type="file"][accept="image/*"]
    Choose File    ${file_input}    ${IMAGE_PATH}
    Input Text    ${Title-path}    ${Heading}
    Input Text    ${Description}    ${Description_name}
    Click Element    ${TYPE}
    Click Element    ${Train_From_Us}
    Click Element    ${submit}
    Sleep    5
    ${current_url}=    Get Location
    Should Not Be Equal    ${initial_url}    ${current_url}

Search How It Work with Valid Data
    [Arguments]    ${search_text}
    Input Text    ${search_Box}    ${search_text}
    Sleep    2s
    Page Should Contain Element    ${search_element}

Search How It Work with Invalid Data
    [Arguments]    ${search_text}
    Input Text    ${search_Box}    ${search_text}
    Sleep    2s
    Page Should Contain Element    ${wrong_search_element}

Delete How It Work
    ${before_text}=    Get Text    //*[@class="MuiTablePagination-displayedRows css-1chpzqh"]
    Click Element    ${delete_icon}
    Click Element    ${delete_button}
    Sleep    2s
    ${after_text}=    Get Text    //*[@class="MuiTablePagination-displayedRows css-1chpzqh"]
    Should Not Be Equal    ${before_text}    ${after_text}
Delete Cancel Button 
    ${initial_url}=    Get Location
    ${before_text}=    Get Text    //*[@class="MuiTablePagination-displayedRows css-1chpzqh"]
    Click Element    ${delete_icon}
    Click Element    ${Cancle_button}
    ${current_url}=    Get Location
    Should Be Equal    ${initial_url}    ${current_url}
Edit How It Work
    [Arguments]    ${Titless}
    Click Element    ${Edit_button}
    Wait Until Element Is Visible    ${Title-path}    timeout=10s
    Press Keys    ${Title-path}    CTRL+A    DELETE
    sleep    2
    Input Text    ${title1}    ${Titless}
    Click Element    ${update_button}
    Wait Until Element Is Visible    ${count}    timeout=10s
    ${Edit_element_locator}=    Get Text    ${Edit_checl}
    Should Be Equal    ${Titless}    ${Edit_element_locator}

Validate Rows Per Page Dropdown
    [Arguments]    ${rows_per_page}
    Click Element    ${drop_down}
    Click Element    ${drop_down_options['${rows_per_page}']}
    Sleep    2s
    ${actual_count}=    Get Element Count    ${num_of_stacks}
    Should Be True    ${actual_count} <= int(${rows_per_page})
