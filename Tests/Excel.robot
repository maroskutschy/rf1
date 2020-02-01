*** Settings ***
Documentation    Suite description
Library  ExcelLibrary

*** Test Cases ***
Test excel
#  ${document}=  create excel document  document1
#  Should Be Equal As Strings    document1    ${document}
#  log  ${document}
  open excel document  Excel01.xlsx  document1
  ${a1}=  read excel cell  row_num=1	col_num=1
  Should Be Equal As Strings  ${a1}  a

*** Keywords ***

