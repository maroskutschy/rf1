*** Settings ***
Documentation    Suite description
#https://github.com/bulkan/robotframework-requests
Library  RequestsLibrary

*** Test Cases ***
Requests example
    create session  BOFHealth  http://int2-backofficewebapp.production.mnautuk.com:90/backoffice-webapp/cxf/services/monitoring/health
    ${resp}=  get request  BOFHealth  /
    should be equal as strings   ${resp.status_code}  200


*** Keywords ***
