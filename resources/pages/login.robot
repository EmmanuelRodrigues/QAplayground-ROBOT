*** Settings ***
Library    SeleniumLibrary
Variables  ../../config/variables.py

*** Variables ***
&{LOGIN}
...    INPUT_USERNAME=//input[@id="login-username"]
...    INPUT_PASSWORD=//input[@id="login-password"]
...    BUTTON_SIGNIN=//button[@type="submit"]
...    BUTTON_LOGOUT=//button[@data-testid="topbar-logout-btn"]
...    BLOCK_MESSAGE=//span[@data-testid='login-error-message']
...    SHOWPASS_BUTTON=//button[@aria-label="Show password"]
...    HIDE_PASSWORD_BUTTON=//button[@aria-label="Hide password"]

${TIMEOUT}          10s
${URL_DASHBOARD}    https://qaplayground.com/bank/dashboard
${URL_LOGIN}        https://qaplayground.com/bank/login
${BROWSER}          chrome

*** Keywords ***

Open Dashboard
    Open Browser    ${URL_DASHBOARD}    ${BROWSER}

Open Login
    Open Browser    ${URL_LOGIN}    ${BROWSER}

Given I am on the Login page
    Open Login

And I click the Sign In button
    Click Element    ${LOGIN.BUTTON_SIGNIN}

Given I enter valid username and password
    Wait Until Element Is Visible    ${LOGIN.INPUT_USERNAME}    ${TIMEOUT}
    Input Text    ${LOGIN.INPUT_USERNAME}    ${VALID_USER}
    Input Text    ${LOGIN.INPUT_PASSWORD}    ${VALID_PASS}
    And I click the Sign In button

Given I enter blocked user credentials
    Wait Until Element Is Visible    ${LOGIN.INPUT_USERNAME}    ${TIMEOUT}
    Input Text    ${LOGIN.INPUT_USERNAME}    ${LOCKED_USER}
    Input Text    ${LOGIN.INPUT_PASSWORD}    ${LOCKED_PASS}
    And I click the Sign In button

Given I enter invalid credentials
    Wait Until Element Is Visible    ${LOGIN.INPUT_USERNAME}    ${TIMEOUT}
    Input Text    ${LOGIN.INPUT_USERNAME}    AASD@#$%$#
    Input Text    ${LOGIN.INPUT_PASSWORD}    159841
    And I click the Sign In button

Given I leave the username field empty
    Wait Until Element Is Visible    ${LOGIN.INPUT_USERNAME}    ${TIMEOUT}
    Input Text    ${LOGIN.INPUT_PASSWORD}    ${LOCKED_PASS}
    And I click the Sign In button

Given I leave the password field empty
    Wait Until Element Is Visible    ${LOGIN.INPUT_USERNAME}    ${TIMEOUT}
    Input Text    ${LOGIN.INPUT_USERNAME}    ${VALID_USER}
    And I click the Sign In button

Then I should see the Dashboard page
    Wait Until Element Is Visible    ${LOGIN.BUTTON_LOGOUT}    ${TIMEOUT}
    Location Should Be    ${URL_DASHBOARD}
    Page Should Contain    Welcome back, Alex
    Element Should Not Be Visible    ${LOGIN.BUTTON_SIGNIN}
    Element Should Be Visible    ${LOGIN.BUTTON_LOGOUT}

Then I should see the account suspension message
    Wait Until Element Is Visible    ${LOGIN.BLOCK_MESSAGE}    ${TIMEOUT}
    Element Should Be Visible    ${LOGIN.BLOCK_MESSAGE}
    Wait Until Page Contains    Your account has been suspended. Please contact support.    ${TIMEOUT}
    Page Should Contain    Your account has been suspended. Please contact support.

Then I should see the invalid credentials error message
    Wait Until Page Contains    The username or password you entered is incorrect.    ${TIMEOUT}
    Page Should Contain    The username or password you entered is incorrect.

Then I should see the username required message
    Wait Until Page Contains    Please enter your username.    ${TIMEOUT}
    Page Should Contain    Please enter your username.

Then I should see the password required message
    Wait Until Page Contains    Please enter your password.    ${TIMEOUT}
    Page Should Contain    Please enter your password.

Then the password toggle should display "Show password"
    ${aria_label}=    Get Element Attribute
    ...    ${LOGIN.SHOWPASS_BUTTON}
    ...    aria-label
    Should Be Equal As Strings    ${aria_label}    Show password

the password should be masked
    ${type}=    Get Element Attribute
    ...    ${LOGIN.INPUT_PASSWORD}
    ...    type
    Should Be Equal As Strings    ${type}    password

When I click the "Show password" button
    Wait Until Element Is Visible    ${LOGIN.SHOWPASS_BUTTON}    ${TIMEOUT}
    Click Element    ${LOGIN.SHOWPASS_BUTTON}

When I click the "Hide password" button
    Wait Until Element Is Visible    ${LOGIN.HIDE_PASSWORD_BUTTON}    ${TIMEOUT}
    Click Element    ${LOGIN.HIDE_PASSWORD_BUTTON}

Then the password should be visible
    ${type}=    Get Element Attribute
    ...    ${LOGIN.INPUT_PASSWORD}
    ...    type
    Should Be Equal As Strings    ${type}    text

Then the password toggle should display "Hide password"
    ${aria_label}=    Get Element Attribute
    ...    ${LOGIN.HIDE_PASSWORD_BUTTON}
    ...    aria-label
    Should Be Equal As Strings    ${aria_label}    Hide password

When I log out
    Wait Until Element Is Visible    ${LOGIN.BUTTON_LOGOUT}    ${TIMEOUT}
    Click Element    ${LOGIN.BUTTON_LOGOUT}

Then I should be redirected to the Login page
    Wait Until Element Is Visible    ${LOGIN.BUTTON_SIGNIN}    ${TIMEOUT}
    Element Should Be Visible    ${LOGIN.BUTTON_SIGNIN}
    Location Should Be    ${URL_LOGIN}
    Page Should Contain    Sign in to your account
