*** Settings ***
Documentation    Suite description

Library  Pdf2TextLibrary
*** Test Cases ***
Pdf To Text
  ${data} =  convert pdf to txt  RF_1.pdf
  log  ${data}
  ${number_of_pages}=  count pdf pages  RF_1.pdf
  log  ${number_of_pages}

*** Keywords ***
