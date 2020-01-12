*** Settings ***

Library  SeleniumLibrary

Resource  Resources/PO/LandingPage.robot

*** Keywords ***
#Refactored
Search for Products Refactored ${PRODUCT}
    Verify Page Loaded


Search for Products ${PRODUCT}
    wait until page contains  Your Amazon.com
    input text  id=twotabsearchtextbox  ${PRODUCT}
    click button  xpath=//input[@type='submit' and @class='nav-input']
    wait until page contains  results for "${PRODUCT}"

Select Product from Search Results
    wait until page contains element  xpath=//span[@class='a-size-base-plus a-color-base a-text-normal']
    click element  //span[@class='a-size-base-plus a-color-base a-text-normal']
    wait until page contains  Back to results

Add Product to Cart
    click button  id=add-to-cart-button
    wait until page contains  Added to Cart
    wait until page contains  Proceed to checkout (1 item)

Begin Checkout
    #click link  Proceed to checkout (1 item)
    #click element  id=attach-sidesheet-checkout-button
    click element  xpath=//a[@class='a-button-text a-text-center']
    page should contain element  xpath=//h1[@class='a-spacing-small']
    element text should be  xpath=//h1[@class='a-spacing-small']  Sign-In


