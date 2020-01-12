*** Settings ***
Documentation    Suite description
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
User must Sign in
    [Tags]    DEBUG
    [Documentation]  Basic Test
    Open Browser  http://www.amazon.com  chrome
    wait until page contains  Your Amazon.com
    input text  id=twotabsearchtextbox  Ferrari 458
    click button  xpath=//input[@type='submit' and @class='nav-input']
    wait until page contains  results for "Ferrari 458"
    wait until page contains element  xpath=//span[@class='a-size-base-plus a-color-base a-text-normal']
    click element  //span[@class='a-size-base-plus a-color-base a-text-normal']
    wait until page contains  Back to results
    click button  id=add-to-cart-button
    wait until page contains  Added to Cart
    click link  Proceed to checkout (1 item)
    page should contain element  xpath=//h1[@class='a-spacing-small']
    element text should be  xpath=//h1[@class='a-spacing-small']  Sign-In
    Close Browser
    log






*** Keywords ***
