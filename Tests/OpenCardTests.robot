*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${URL}    https://demo.opencart.com/
${TEST_ITEM}    iPhone
${ALLERT}    css=div[class='alert alert-success alert-dismissible']


*** Test Cases ***
Check title and logo text in opencard homepage
    Open Browser And Check Title And Logo    Your Store
    Close Browser

*** Test Cases ***
Verify of iPhone item from the store via search
    Open Browser And Check Title And Logo    Your Store
    Input Text    name=search    ${TEST_ITEM}
    Search item via search field    ${TEST_ITEM}
    Close Browser

*** Test Cases ***
Check adding item to the shopping cart
    Open Browser And Check Title And Logo    Your Store
    Search item via search field    ${TEST_ITEM}
    Click Element    css=div[class='image'] a
    Click Button    css=#button-cart
    Wait Until Element Is Visible    css=div[class='alert alert-success alert-dismissible']
    Page Should Contain    Success: You have added iPhone to your shopping cart!

*** Test Cases ***
Verify of not adding item in to wish list if not logged in user
    Open Browser And Check Title And Logo    Your Store
    Click Button    css=.product-layout:nth-child(1) button:nth-child(2)
    Wait Until Element Is Visible    ${ALLERT}
    Page Should Contain    You must login or create an account to save MacBook to your wish list!


*** Test Cases ***
Verify the registration of new user in register page
    Open Browser    https://demo.opencart.com/index.php?route=account/register    ${BROWSER}    remote_url=http://127.0.0.1:4444/wd/hub
    Input Text    name=firstname    TestFirstName
    Input Text    name=lastname    TestLastName
    Input Text    name=email    TestEmail@mail.com
    Input Text    name=telephone    +481234123
    Input Text    name=password    TestPassword123
    Input Text    name=confirm    TestPassword123
    Click Button    name=agree
    Click Button    css=.btn-primary
    Page Should Contain    Your Account Has Been Created!


*** Keywords ***
Open Browser And Check Title And Logo    [Arguments]    ${VALUE}
    Open Browser    ${URL}    ${BROWSER}    remote_url=http://127.0.0.1:4444/wd/hub
    ${TITLE}    Get Title
    Should Contain    ${TITLE}    ${VALUE}
    Page Should Contain    ${VALUE}

Search item via search field    [Arguments]    ${VALUE}
    Input Text    name=search    ${VALUE}
    Press Keys    name=search    ENTER
