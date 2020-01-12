*** Variables ***
${var2}   value2

*** Keywords ***
Begin Web Test ${URL}
    Open Browser  ${URL}  chrome

End Web Test
     Close Browser

LoggingInCommonList @{LIST}
    log  @{LIST}[0]
    log  @{LIST}[1]
    log  @{LIST}[2]

LoggingInCommonString ${URL}
    log  ${URL}
    ${var1} =  set variable  value1
    log  ${PRODUCT}
    log  ${VARx}




