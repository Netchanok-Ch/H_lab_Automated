*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}  Chrome

*** Keywords ***

Open Shopee Website
    ${URL}=    Set Variable    
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2s

Verify Home Page Title
    Title Should Be    Shopee: Buy and Sell on Mobile or Online, Best Marketplace for You

Verify Language Is EN
    ${lang}=    Get Element Attribute    xpath=//html    lang
    Should Be Equal As Strings    ${lang}    en

Search For Product
    [Arguments]    ${search_term}
    Input Text    xpath=//input[@type="search"]    ${search_term}
    Press Key    xpath=//input[@type="search"]    ENTER
    Sleep    2s

Verify Search Results Are Displayed
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'shopee-search-item-result__item')]
    Page Should Contain Element    xpath=//div[contains(@class, 'shopee-search-item-result__item')]
