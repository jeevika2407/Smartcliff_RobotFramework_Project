*** Settings ***
Documentation    Current Availability Resources for Smartcliff Admin Website
Library    SeleniumLibrary

*** Variables ***
${username}   smart@gmail.com
${password}    1234
<<<<<<< HEAD
${menu_button}    //button[@aria-label="open drawer"]
=======
${menu_button}    //div[@class="MuiToolbar-root MuiToolbar-gutters MuiToolbar-regular css-i6s8oy"]/following::button
>>>>>>> 9aae2b5 (Current Availability on 28MAY2025)
${bussiness}    //ul[@class="MuiList-root MuiList-padding css-1ontqvh"]/li[6]
${current_availability}    //div[@class="MuiListItemText-root css-1tsvksn"]/span[text()='Current Availability']
${searchbox}    //input[@placeholder="Search by Skillset..."]    #search the value 
${fullstack}    //table[@class="MuiTable-root css-1owb465"]/tbody/tr/td[1]     #assert
${add_new_btn}    //div[@class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 MuiGrid-grid-md-6 css-1gt1d87"]/button
<<<<<<< HEAD

=======
>>>>>>> 9aae2b5 (Current Availability on 28MAY2025)
${submit_btn}    //button[@type="submit"]    


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

<<<<<<< HEAD
Click on Search box and Assert the Fullstack
    Input Text    ${searchbox}    Full stack
    Wait Until Element Is Visible    ${fullstack}
    Element Should Contain    ${fullstack}    Full stack

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
    
=======

>>>>>>> 9aae2b5 (Current Availability on 28MAY2025)


