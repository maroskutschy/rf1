*** Settings ***
Documentation    Suite description

Library  MyLibrary
Library  GmailSendEmailLibrary

*** Test Cases ***
My test
    ${result}=  join two strings  hello  world
    should be equal  ${result}  hello world
    send mail no attachment  jasecudeveloper1@gmail.com  Jasecu11  jasecudeveloper1@gmail.com  This is a test, this is a test  Test is in progress



*** Keywords ***
Provided precondition
