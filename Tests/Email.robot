*** Settings ***
Documentation    Suite description
Library  ImapLibrary2
Library  SmtpLibrary

*** Test Cases ***
Email
    # setup gmail accout: security - Less secure apps acces - enable
    # mail - seetings > settings > Forwarding and POP/IMAP - Enable IMAP
    open mailbox  host=imap.googlemail.com  user=jasecudeveloper1@gmail.com    password=Jasecu11
    ${email_body}  get email body  3
    log  ${email_body}
    #example: https://github.com/lucamaro/robotframework-smtplibrary/blob/master/examples/scenarios/Mail.txt
    prepare connection     smtp.gmail.com    25    jasecudeveloper1@gmail.com    Jasecu11
    Connect
    EHLO
    #starttls  smtp.gmail.com
    EHLO
    ${Esmtp_Features}=  Get Esmtp Features
    log  ${Esmtp_Features}
    Login
    Set From    jasecudeveloper1@gmail.com
    Add To Recipient    jasecudeveloper1@gmail.com
    ${orig_body}=    Set Variable    This is a test
    Set Body    ${orig_body}
    Send Message
    Quit
    Close Connection

*** Keywords ***
Provided precondition
