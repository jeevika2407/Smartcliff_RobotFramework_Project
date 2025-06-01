*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${user_icon}    xpath://button[@class='MuiButtonBase-root MuiIconButton-root MuiIconButton-sizeSmall css-qx3f9p']
${logout_btn}    xpath://div[@class='MuiPaper-root MuiPaper-elevation MuiPaper-rounded MuiPaper-elevation0 MuiPopover-paper MuiMenu-paper MuiMenu-paper css-1n607ev']/descendant::li[2]
${toast}    xpath://div[contains(@class, "Toastify__toast")]
${login_btn}    xpath://*[@id="signin-submit"]
${MAX_RETRIES}    3
${RETRY_COUNT}    0
${username}   smart@gmail.com
${password}    1234

*** Keywords ***
Logout From Current Session
    Wait Until Element Is Not Visible    ${toast}    timeout=15s
    ${logout_success}=    Set Variable    False
    WHILE    ${RETRY_COUNT} < ${MAX_RETRIES}
        Click Element    ${user_icon}
        Wait Until Element Is Visible    ${logout_btn}    timeout=5s
        Click Element    ${logout_btn}
        ${logout_success}=    Run Keyword And Return Status    Page Should Contain Element    ${login_btn}
        # ${url}=    Get Location
        # Log To Console    Current URL: ${url}
        Exit For Loop If    ${logout_success}
        Sleep    1s
        ${RETRY_COUNT}=    Evaluate    ${RETRY_COUNT} + 1
    END
    IF    not ${logout_success}
        Fail    Logout failed after ${MAX_RETRIES} retries
    END