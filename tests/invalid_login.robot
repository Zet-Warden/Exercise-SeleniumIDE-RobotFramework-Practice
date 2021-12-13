*** Settings ***
Documentation   A test suite with a single test for invalid login
...             
...             This test follows the example using keywords from
...             the SeleniumLibrary
Library         SeleniumLibrary


*** Test Cases ***
Invalid Login
    # open browser
    Open Browser    https://www.saucedemo.com/  chrome
    # set window size
    Maximize Browser Window
    # check if in login page
    Page Should Contain Element     login-button
    # input username
    Input Text  user-name   standard_user
    # input password
    Input Password  password    secret_sauce
    # click login button
    Click Button    login-button
    # should be open in products page
    Element Text Should Be  class:title     PRODUCTS
    # close browser
    [Teardown]  Close Browser