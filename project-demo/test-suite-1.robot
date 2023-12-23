*** Settings ***
Library           SeleniumLibrary

*** variables ***
${BROWSER}     chrome
${HOST}    http://localhost/testqa/login-main/
${EMAIL}    masrud
${PASS-1}    masrud.com    # correct password
${PASS-2}    xxs    # wrong password

${COMPANY}    global.inc
${TITLE}    [TEST] Senior Engineering manager
${LOCATION}     Singapore
${TAGS}    engineering manager software
${JOBEMAIL}    jobs@global.co
${WEBSITE}    https://global.co
${DESCRIPTION}     Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 

*** Test Cases ***

# login
# positive test
testcase-1
    Login Success
    Close Browser    

# negative test
testcase-2
    Open Browser    ${HOST}    ${BROWSER}
    input text        name:username       ${EMAIL}
    input text        name:password    ${PASS-2}
    Click Element     xpath://button[@type='submit']
    Close Browser 

# logout
testcase-3
    Login Success
    Go To    http://localhost/testqa/login-main/
    Close Browser 


*** Keywords ***

Scroll Down Until End
    ${previous_height}=    Execute Javascript    return document.body.scrollHeight;
    FOR  ${i}    IN RANGE    10
        Execute Javascript    window.scrollTo(0, document.body.scrollHeight);
        Sleep    1s
        ${current_height}=    Execute Javascript    return document.body.scrollHeight;
        Exit For Loop If    '${current_height}' == '${previous_height}'
        ${previous_height}=    Set Variable    ${current_height}
        Sleep    2s
    END

Login Success
    Open Browser    ${HOST}    ${BROWSER}
    input text        name:username       ${EMAIL}
    input text        name:password    ${PASS-1}
    Click Element     xpath://button[@type='submit']