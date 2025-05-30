*** Settings ***
Documentation    Current Availability Resources for Smartcliff Admin Website
Library    SeleniumLibrary

*** Variables ***

# Login credentials
${username}   smart@gmail.com
${password}    1234

# Locators for navigation
${menu_button}    //div[@class="MuiToolbar-root MuiToolbar-gutters MuiToolbar-regular css-i6s8oy"]/button[1]
${bussiness}    //ul[@class="MuiList-root MuiList-padding css-1ontqvh"]/li[6]
${current_availability}    //div[@class="MuiListItemText-root css-1tsvksn"]/span[text()='Current Availability']

# Search and form fields
${searchbox}    //input[@placeholder="Search by Skillset..."]    #search the value 
${fullstack}    //table[@class="MuiTable-root css-1owb465"]/tbody/tr/td[1]     #assert
${add_new_btn}    //div[@class="MuiGrid-root MuiGrid-item MuiGrid-grid-xs-12 MuiGrid-grid-md-6 css-1gt1d87"]/button
${initial_url}    https://smart-cliff-admin.vercel.app/business/current-availability-control
${submit_btn}    //button[@type="submit"]   
${delete_btn}    //table/tbody/tr[1]/td[last()]/button[2]
${delete_btn2}   //button[@class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedError MuiButton-sizeMedium MuiButton-containedSizeMedium MuiButton-root MuiButton-contained MuiButton-containedError MuiButton-sizeMedium MuiButton-containedSizeMedium css-16hxacb"]
${edit_btn}    //table//tr[1]/td[6]//button[1]
${page}    //div[@class="MuiSelect-select MuiTablePagination-select MuiSelect-standard MuiInputBase-input css-1cccqvr"]
${page-10}    //li[@class="MuiButtonBase-root MuiMenuItem-root MuiMenuItem-gutters MuiMenuItem-root MuiMenuItem-gutters MuiTablePagination-menuItem css-1gs62wq"][1]


*** Keywords ***

# Logs in using given username and password
fill the login form
    [Arguments]    ${Username}    ${Password}
    Input Text    ${user}    ${Username}
    Input Password    ${pass}    ${Password}
    Click Button    ${login}

# Navigates through the menu to reach the Current Availability page
Click on the Menu button and choose Current Availability by Clicking on the Bussiness
    Click Element    ${menu_button}
    Click Element    ${bussiness}
    Click Element    ${current_availability}

# Searches for 'Fullstack' and asserts it is displayed in the table
Click on Search box and Assert the Fullstack
    Input Text    ${searchbox}    Fullstack
    Wait Until Element Is Visible    ${fullstack}
    Element Should Contain    ${fullstack}    Fullstack

# Clicks add new and fills the Current Availability form
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

# Verifies that form error messages appear for invalid submission
Assert Form Error Messages Are Displayed
    ${current_url}=    Get Location
    Should Not Be Equal    ${initial_url}    ${current_url}

# Clicks the edit button and updates the skillset value
Click on the Edit button and make change on the Resources
    Input Text    ${searchbox}    Fullstack
    Wait Until Element Is Visible    ${edit_btn}
    Click Element    ${edit_btn}
    Click Element    //input[@name="skillset"]
    Press Keys    //input[@name="skillset"]    CTRL+a 
    Input Text    //input[@name="skillset"]     Full stack
    Click Button    ${submit_btn}
    Wait Until Page Contains Element    ${searchbox}

# Deletes the Fullstack record and verifies it's no longer present
Click on the Delete Button and Assert the Fullstack is not present
    Click Element    ${delete_btn}
    Click Element    ${delete_btn2}
    Wait Until Page Contains Element    ${searchbox}
    Input Text    ${searchbox}    Fullstack
    sleep   5s
    Page Should Not Contain    ${fullstack}

# Clicks to change the pagination to 10 per page
Click on the Pagination 
    Click Element    ${page}
    Click Element    ${page-10}
        
