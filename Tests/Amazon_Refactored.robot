*** Settings ***
Documentation    Suite description

Resource  Resources/Amazon_Resource.robot
Resource  Resources/Common_Resource.robot

Test Setup  Common_Resource.Begin Web Test ${URL}
Test Teardown  Common_Resource.End Web Test

*** Variables ***

${URL}  http://www.amazon.com
${PRODUCT}  Ferrari 458
@{LIST}  item1  item2  item3
${VARx}  valueX




*** Test Cases ***
User must Sign in Refactored
    [Tags]    DEBUG
    [Documentation]  Basic Test
    Amazon_Resource.Search for Products ${PRODUCT}
    Amazon_Resource.Select Product from Search Results
    Amazon_Resource.Add Product to Cart
    Amazon_Resource.Begin Checkout

Logging
    LoggingInCommonList @{LIST}
    LoggingInCommonString ${URL}
    log  ${var2}





