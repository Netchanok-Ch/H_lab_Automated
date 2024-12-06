*** Settings ***
Library    SeleniumLibrary
Resource   ../Keyword/keywords_test.robot
Suite Setup        Open Browser   ${URL} Chrome
Suite Teardown     Close Browser

*** Variables ***
${URL}          https://shopee.co.th/
${BROWSER}      Chrome
${SEARCH_TERM}  baby toys
${variable}    variable

*** Test Cases ***

Scenario A: Verify landing on Shopee home page with EN language
    ${variable}=    Open Shopee Website
    ${url}=    Get Location
    Should Be Equal As Strings    ${url}    https://shopee.co.th/
    Wait Until Element Is Visible    xpath=//img[@alt="shopee logo"]    timeout=10s

Scenario B: Search for keywords “baby toys”
    Search For Product    ${SEARCH_TERM}
    Wait Until Element Is Visible    xpath=//input[@placeholder="Search for products, brands and shops"]    timeout=10s
    Input Text    xpath=//input[@placeholder="Search for products, brands and shops"]    ${search_term}
    Press Key    xpath=//input[@placeholder="Search for products, brands and shops"]    ENTER
    Sleep    2s

Scenario C: Display search result as a list
    Verify Search Results Are Displayed
    Wait Until Element Is Visible    xpath=//section[@class="shopee-search-item-result"])]
    Page Should Contain Element    xpath=//section[@class="shopee-search-item-result"])]

