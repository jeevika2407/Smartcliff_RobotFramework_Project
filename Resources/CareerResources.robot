*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${threelines}    xpath = (//*[@class="MuiSvgIcon-root MuiSvgIcon-fontSizeMedium css-vubbuv"])[1]
${Career}    xpath = //*[@class="MuiList-root MuiList-padding css-1ontqvh"]//child::li[7]
${CareerPage}    xpath = (//*[@class="MuiList-root css-1uzmcsd"]//child::div[2])[1]
${CareerPageTitle}    xpath = //*[@class="MuiBox-root css-19kzrtu"]//child::h4

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

