*** Settings ***
Documentation    Current Availability Resources for Smartcliff Admin Website
Library    SeleniumLibrary

*** Variables ***
${username}   smart@gmail.com
${password}    1234
${menu_button}    //div[@class="MuiToolbar-root MuiToolbar-gutters MuiToolbar-regular css-i6s8oy"]/following::button
${bussiness}    //ul[@class="MuiList-root MuiList-padding css-1ontqvh"]/li[6]
${current_availability}    //div[@class="MuiListItemText-root css-1tsvksn"]/span[text()='Current Availability']
${searchbox}    //input[@placeholder="Search by Skillset..."]    #search the value 
${fullstack}    //table[@class="MuiTable-root css-1owb465"]/tbody/tr/td[1]     #assert
${add_new_btn}    //div[@class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 MuiGrid-grid-md-6 css-1gt1d87"]/button
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




