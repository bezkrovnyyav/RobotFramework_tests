*** Settings ***
Documentation    тесты с проверками  opencart
Library    SeleniumLibrary
Resource  ../PageObjects/MainPage.robot

Suite Setup    Open Browser    browser=${BROWSER}
Suite Teardown    Close Browser
Test Setup    go to    url=${URL}

*** Variables ***
${BROWSER}    chrome
${URL}    https://demo.opencart.com

*** Test Cases ***
Check title
    verify page title should contains    Your Store

Check search title
    Search Product    mac
    verify page title should contains    Search - mac

Check shopping cart title
    click link    ${SHOPPING_CART}
    verify page title should contains    Shopping Cart

Check checkout title
    click link    ${CHECKOUT}
    verify page title should contains    Shopping Cart

Check wishlist title
    click link    ${WISHLIST}
    verify page title should contains    Account Login
