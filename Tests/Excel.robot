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

*** Keywords ***

