*** Settings ***

Library  SeleniumLibrary

*** Keywords ***

Verify Page Loaded
    wait until page contains  Your Amazon.com
