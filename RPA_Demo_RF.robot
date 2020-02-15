# how to run whole file:
# robot --pythonpath /Users/Maros/Python/PyCharm/Amayon/ RPA_Demo_RF.robot
# robot --pythonpath c:\PyCharm_Projects_2\RF_1\rf1\ RPA_Demo_RF.robot
# where is stored chromedriver.exe:
# c:\Users\maros.kutschy\AppData\Local\Programs\Python\Python38-32\Scripts\chromedriver.exe
*** Settings ***
Documentation    Suite description
Library  Pdf2TextLibrary
Library  MyLibrary
Library  GmailSendEmailLibrary
Library  ImapLibrary2
Library  ExcelLibrary
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
Read text from pdf
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
    set global variable  ${global_email_body}  ${email_body}
    log  Email body is: ${global_email_body}

Compare text from PDF and from email
    should contain  ${global_email_body}  ${global_data}
    # the following step will fail
    #should contain  ${global_data}  ${global_email_body}

Test excel - write text to xlsx file and read text from xlsx file
  open excel document  Excel01.xlsx  document1
  ${a1}=  read excel cell  row_num=1	col_num=1
  Should Be Equal As Strings  ${a1}  a
  ${a3_a}=  read excel cell  row_num=3	col_num=1
  Should Be Equal As Strings  ${a3_a}  None
  write excel cell  row_num=3	col_num=1  value=e
  save excel document  Excel01.xlsx
  ${a3_b}=  read excel cell  row_num=3	col_num=1
  Should Be Equal As Strings  ${a3_b}  e
  write excel cell  row_num=3	col_num=1  value=None
  save excel document  Excel01.xlsx
  ${a3_c}=  read excel cell  row_num=3	col_num=1
  Should Be Equal As Strings  ${a3_c}  None

Open webpage
    open Browser  http://www.google.com  chrome
    wait until page contains  Sign in
    input text  name=q  Robotic Process Automation
    close browser


