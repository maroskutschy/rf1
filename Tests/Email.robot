*** Settings ***
Documentation    Suite description
Library  ImapLibrary2

*** Test Cases ***
Email
    # setup gmail accout: security - Less secure apps acces - enable
    # mail - seetings > settings > Forwarding and POP/IMAP - Enable IMAP
    open mailbox  host=imap.googlemail.com  user=jasecudeveloper1@gmail.com    password=Jasecu11
    ${email_body}  get email body  3
    log  ${email_body}

*** Keywords ***
Provided precondition
