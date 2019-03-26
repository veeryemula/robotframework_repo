*** Settings ***
Library    SeleniumLibrary

Suite Setup        Log    I am inside Test Suite Setup
Suite Teardown     Log    I am inside Test Suite Teardown
Test Setup         Log    I am inside Test Setup
Test Teardown      Log    I am inside Test Teardown

Default Tags    Functional
    
*** Test Cases ***
TC1
    [Tags]         Smoke
    Log            Test Case 1


TC2
    Log            Test Case 1
    Set Tags       Regression
    
TC3
    [Tags]         Sanity
    Log            Test Case 1
    Remove Tags    Functional

# Sc1_LogMessage
    # Log    Hello World!
    
# Sc2_GoogleSearch   
    # Open Browser    https://google.com    firefox
    # Set Browser Implicit Wait             5
    # Input Text      name=q                GGKTech
    # Press Keys      name=q                ENTER
    # # Click Button  name=btnK    
    # Sleep           2    
    # Close Browser
    # Log             Test Completed
    
# Sc3_OrangeHRMLogin
    # Open Browser    ${OrangeHRM_URL}    chrome
    # Set Browser Implicit Wait           ${Implicit_Wait}
    # KW_LoginOrangeHRM
    # Click Element   id=welcome
    # Click Link      Logout    
    # Close Browser
    # Log             This test was executed by %{username} on %{os}
    
    
*** Variables ***
${OrangeHRM_URL}    https://opensource-demo.orangehrmlive.com/index.php/auth/login
@{Credentails}      Admin             admin123
&{LoginData}        userName=Admin    password=admin123
${Implicit_Wait}    5


*** Keywords ***

KW_LoginOrangeHRM
    Input Text      name=txtUsername        &{LoginData}[userName]
    Input Password  name=txtPassword        @{Credentails}[1]
    Click Button    name=Submit