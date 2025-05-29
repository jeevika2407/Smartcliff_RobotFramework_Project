*** Settings ***
Documentation   Learning Journey Resources for Smartcliff Admin Website
Library    SeleniumLibrary
Library    OperatingSystem


*** Variables ***

${username}   smart@gmail.com
${password}    1234
${menu_button}    //button[@aria-label="open drawer"]
${bussiness}    //ul[@class="MuiList-root MuiList-padding css-1ontqvh"]/li[6]
${learning_journey}    //div[@class="MuiListItemText-root css-1tsvksn"]/span[text()='Learning Journey']
${searchbox_lj}    //input[@placeholder="Search Learning Journeys..."]
${add_btn}    (//button[@type='button'])[4]
${type}    //div[@role="combobox"]
${hire}    //ul[@class="MuiList-root MuiList-padding MuiMenu-list css-r8u8y9"]/li[1]
${train}    //ul[@class="MuiList-root MuiList-padding MuiMenu-list css-r8u8y9"]/li[2]
${title_add}    //input[@class="MuiInputBase-input MuiOutlinedInput-input"]
${text_area}    //label[text()='Description']/following::textarea
${img_area}    //div[@class="MuiDropzoneArea-textContainer"]
${submit_btn}    //button[@type="submit"]
${initial_url}    https://smart-cliff-admin.vercel.app/business/learningjourney-control
${edit}    (//table//tr[1]//td[4]//div//button)[1]
${delete}    (//table//tr[1]//td[4]//div//button)[2]
${delete2}    //div[@class="MuiDialogActions-root MuiDialogActions-spacing css-1vskg8q"]/button[2]


*** Keywords ***

fill the login form
    [Arguments]    ${Username}    ${Password}
    Input Text    ${user}    ${Username}
    Input Password    ${pass}    ${Password}
    Click Button    ${login}

Click on the Menu Button and Click on Bussiness
    Click Element    ${menu_button}
    Click Element    ${bussiness}

Click on Learning Journey from Bussiness
    Click Element    ${learning_journey}

Click on Search box and Insert Value as hirefromus
    Click Element    ${searchbox_lj}
    Input Text    ${searchbox_lj}    hirefromus
    Wait Until Element Is Visible    ${searchbox_lj}

Click on Add new Learning Journey button and Fill the Form
    [Arguments]    ${title}    ${desc}    ${img}    
    Click Element    ${add_btn}
    Click Element    ${type}
    Click Element    ${hire}
    Click Element    ${title_add}    
    Input Text    ${title_add}    ${title}
    Click Element    ${text_area}
    Input Text    ${text_area}    ${desc}
    ${img_abs}=    Normalize Path    ${CURDIR}/${img}
    Choose File     //input[@type='file']    ${img_abs}
    sleep    5s
    Click Element    ${submit_btn}

Assert Error Messages Are Displayed
    ${current_url}=    Get Location
    Should Not Be Equal    ${initial_url}    ${current_url}

Asserting the hirefromus in the Tablular Display
    Page Should Contain Element    //td[text()='hirefromus']
    
Edititng the hirefromus into trainfromus
    
    Click Element    ${edit}
    Click Element    ${type}
    Click Element    ${train}

    Click Element    ${submit_btn}

Assert the trainfromus in the Tablular Display

    Page Should Contain Element    //td[text()='trainfromus']

        

Deleting an element from the Learning Journey Table

    @{rows}=    Get WebElements    xpath=//tbody[@class="MuiTableBody-root css-1xnox0e"]/tr/td[1]
    ${row_count}=    Get Length    ${rows}
    Log    Total number of rows in table: ${row_count}
    Click Element    ${delete}
    Click Element    ${delete2}
    sleep    5s
    @{titles}=    Get WebElements    xpath=//tbody[@class="MuiTableBody-root css-1xnox0e"]/tr/td[1]
    ${title_count}=    Get Length    ${titles}
    Run Keyword If    ${title_count} >= ${row_count}    Fail    Title count (${title_count}) exceeds row count (${row_count})

