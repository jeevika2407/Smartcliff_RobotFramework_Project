*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${URL}      https://smart-cliff-admin.vercel.app/
${BROWSER}  chrome

*** Keywords ***
Open The Browser With URL
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --incognito
    Call Method    ${options}    add_argument    --disable-extensions
    Call Method    ${options}    add_argument    --disable-notifications
    Call Method    ${options}    add_argument    --disable-popup-blocking
    Call Method    ${options}    add_argument    --start-maximized
    ${prefs}=    Evaluate    {"credentials_enable_service": False, "profile.password_manager_enabled": False}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Open Browser    ${URL}    ${BROWSER}    options=${options}
    Set Selenium Implicit Wait    5

Close The Browser Session
    Close Browser
