*** Settings ***
Documentation    Current Availability Resources for Smartcliff Admin Website
Library    SeleniumLibrary

*** Variables ***
${username}   smart@gmail.com
${password}    1234
${menu_button}    //button[@aria-label="open drawer"]

${bussiness}    //ul[@class="MuiList-root MuiList-padding css-1ontqvh"]/li[6]
${current_availability}    //div[@class="MuiListItemText-root css-1tsvksn"]/span[text()='Current Availability']
${searchbox}    //input[@placeholder="Search by Skillset..."]    #search the value 
${fullstack}    //table[@class="MuiTable-root css-1owb465"]/tbody/tr/td[1]     #assert
${add_new_btn}    //div[@class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 MuiGrid-grid-md-6 css-1gt1d87"]/button
${initial_url}    https://smart-cliff-admin.vercel.app/business/current-availability-control
${submit_btn}    //button[@type="submit"]   
${delete_btn}    //table/tbody/tr[1]/td[last()]/button[2]
${edit_btn}    //table//tr[1]/td[6]//button[1]


*** Keywords ***

fill the login form
    [Arguments]    ${Username}    ${Password}
    Input Text    ${user}    ${Username}
    Input Password    ${pass}    ${Password}
    Click Button    ${login}

Click on the Menu button and choose Current Availability by Clicking on the Bussiness
    Click Element    ${menu_button}
    Click Element    ${bussiness}
    Click Element    ${current_availability}


Click on Search box and Assert the Fullstack
    Input Text    ${searchbox}    Fullstack
    Wait Until Element Is Visible    ${fullstack}
    Element Should Contain    ${fullstack}    Fullstack
    
Click on the Add New Current Availability button and Add Form Values
    [Arguments]    ${skill}    ${resources}    ${duration}    ${batch}    ${exp}    ${remarks}
    Click Element    //*[@id="root"]/div[1]/main/div[2]/div[1]/div[2]/button
    Input Text       //input[@name="skillset"]    ${skill}
    Input Text       //input[@name="resources"]   ${resources}
    Input Text       //input[@name="duration"]    ${duration}
    Input Text       //input[@name="batch"]       ${batch}
    Input Text       //input[@name="experience"]  ${exp}
    Input Text       //textarea[@name="remarks"]     ${remarks}
    Click Button     ${submit_btn}

Assert Form Error Messages Are Displayed
    ${current_url}=    Get Location
    Should Not Be Equal    ${initial_url}    ${current_url}

Click on the Edit button and make change on the Resources
    Input Text    ${searchbox}    Fullstack
    Wait Until Element Is Visible    ${edit_btn}
    Click Element    ${edit_btn}
    Click Element    //input[@name="skillset"] 
    Input Text    //input[@name="skillset"]     Full stack
    Click Button    ${submit_btn}
    Wait Until Page Contains Element    ${searchbox}

Click on the Delete Button and Assert the Fullstack is not present
    Click Element    ${delete_btn}
    Click Element    (//button[text()='Delete'])[2]
    Wait Until Page Contains Element    ${searchbox}
    Input Text    ${searchbox}    Fullstack
    sleep   5s
    Page Should Not Contain    ${fullstack}


