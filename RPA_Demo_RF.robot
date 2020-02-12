# how to run whole file:
# robot --pythonpath /Users/Maros/Python/PyCharm/Amayon/ RPA_Demo_RF.robot
*** Settings ***
Documentation    Suite description
Library  Pdf2TextLibrary
Library  MyLibrary
Library  GmailSendEmailLibrary
Library  ImapLibrary2

*** Variables ***

*** Test Cases ***
Read text in pdf
    ${data} =  convert pdf to txt  RF_1.pdf
    set global variable  ${global_data}  ${data.strip()}
    log  Text from PDF: ${global_data}
    ${number_of_pages}=  count pdf pages  RF_1.pdf
    log  Number of pages in pdf: ${number_of_pages}

Send text by email
    send mail no attachment  jasecudeveloper1@gmail.com  Jasecu11  jasecudeveloper1@gmail.com  This is a test, this is a test  ${global_data}

Read text from email
    open mailbox  host=imap.googlemail.com  user=jasecudeveloper1@gmail.com    password=Jasecu11
    ${LATEST} =  wait for email  sender=jasecudeveloper1@gmail.com
    ${email_body}  get email body  ${LATEST}
    log  ${email_body}
    should contain  ${email_body}  ${global_data}
    # the following step will fail
    #should contain  ${global_data}  ${email_body}


