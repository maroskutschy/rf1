*** Settings ***
Documentation    Suite description
Library  Pdf2TextLibrary
Library  MyLibrary
Library  GmailSendEmailLibrary
Library  ImapLibrary2

*** Variables ***
${data}

*** Test Cases ***
Read text in pdf
    ${data} =  convert pdf to txt  RF_1.pdf
    log  Text from PDF: ${data}
    ${number_of_pages}=  count pdf pages  RF_1.pdf
    log  Number of pages in pdf: ${number_of_pages}

Send text by email
    #send mail no attachment  jasecudeveloper1@gmail.com  Jasecu11  jasecudeveloper1@gmail.com  This is a test, this is a test  ${data}
    send mail no attachment  jasecudeveloper1@gmail.com  Jasecu11  jasecudeveloper1@gmail.com  This is a test, this is a test  Test Data!!!

Read text from email
    open mailbox  host=imap.googlemail.com  user=jasecudeveloper1@gmail.com    password=Jasecu11
    ${LATEST} =  wait for email  sender=jasecudeveloper1@gmail.com
    ${email_body}  get email body  ${LATEST}
    log  ${email_body}
    # how to run whole test suite ?

