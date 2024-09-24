*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary

*** Variables ***
${BASE_URL}    http://localhost:3002

*** Keywords ***

Get Plus JSON
    [Arguments]    ${num1}    ${num2}
    ${resp}=     GET    ${BASE_URL}/plus/${num1}/${num2}

    Should Be Equal    ${resp.status_code}    ${200}

    RETURN    ${resp.json()}

*** Test Cases ***
Test Plus Numbers 4 and 2 (ฺBefore Using Keywords)

    ${resp}=     GET    ${BASE_URL}/plus/4/2

    Should Be Equal    ${resp.status_code}    ${200}

    ${json_resp}=    Set Variable  ${resp.json()}

    Should Be Equal    ${json_resp}    ${6}

Test Plus Numbers 5 and 6 (ฺBefore Using Keywords)

    ${resp}=     GET    ${BASE_URL}/plus/5/6

    Should Be Equal    ${resp.status_code}    ${200}

    ${json_resp}=    Set Variable  ${resp.json()}

    Should Be Equal    ${json_resp}    ${11}


Test Calculate Numbers 3 and 4

    ${json_resp}=    Get Plus JSON    ${4}    ${2}

    Should Be Equal    ${json_resp}    ${6}
