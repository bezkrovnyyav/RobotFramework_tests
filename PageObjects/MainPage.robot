*** Settings ***
Library  SeleniumLibrary

*** Keywords ***
verify page title should contains    [Arguments]    ${VALUE}
    sleep    2
    ${TITLE}    get title
    should contain    ${TITLE}    ${VALUE}

Search Product    [Arguments]  ${request}
    Input Text  ${SEARCH_INPUT}  ${request}
    Click Button  ${SEARCH_BUTTON}
    Wait Until Page Contains Element  xpath=//h1[text()='Search - ${request}']

*** Variables ***
${SEARCH_INPUT}    css=#search input
${SEARCH_BUTTON}    css=#search button
${SHOPPING_CART}    css:a[title='Shopping Cart']
${CHECKOUT}    css:a[title='Checkout']
${WISHLIST}    css:a[title='Wish List (0)']