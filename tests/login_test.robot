*** Settings ***
Resource    ../resources/main.robot

Test Setup       Given I am on the Login page
Test Teardown    Close browser session

*** Test Cases ***
TC01 - Login with valid credentials
    [Documentation]    Validates login with valid credentials.
    [Tags]    valid    login
    Given I enter valid username and password
    Then I should see the Dashboard page

TC02 - Login with blocked user
    [Documentation]    Validates that a blocked user cannot log in.
    [Tags]    invalid    login
    Given I enter blocked user credentials
    Then I should see the account suspension message

TC03 - Login with invalid credentials
    [Documentation]    Validates the error message when invalid credentials are provided.
    [Tags]    invalid    login
    Given I enter invalid credentials
    Then I should see the invalid credentials error message

TC04 - Login without username
    [Documentation]    Validates the error message when the username field is left empty.
    [Tags]    invalid    login
    Given I leave the username field empty
    And I click the Sign In button
    Then I should see the username required message

TC05 - Login without password
    [Documentation]    Validates the error message when the password field is left empty.
    [Tags]    invalid    login
    Given I leave the password field empty
    And I click the Sign In button
    Then I should see the password required message

TC06 - Validate password masking
    [Documentation]    Verifies that the password is masked by default.
    [Tags]    login    ui    security
    Given I enter valid username and password
    Then the password toggle should display "Show password"
    And the password should be masked

TC07 - Show and hide password
    [Documentation]    Verifies the password visibility toggle behavior.
    [Tags]    login    ui
    Given I enter valid username and password
    Then the password should be masked
    When I click the "Show password" button
    Then the password should be visible
    When I click the "Hide password" button
    Then the password should be masked

TC08 - Authentication, Dashboard access and logout
    [Documentation]    Validates the complete authentication, Dashboard access, and logout flow.
    [Tags]    login    dashboard    logout    e2e
    Given I enter valid username and password
    Then I should see the Dashboard page
    When I log out
    Then I should be redirected to the Login page
