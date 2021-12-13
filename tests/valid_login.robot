*** Settings ***
Documentation   A test suite with a single test for valid login
...             
...             This test follows the example using keywords from
...             the SeleniumLibrary
Library         SeleniumLibrary


*** Test Cases ***
Valid Login
    # open browser
    Open Browser    https://www.saucedemo.com/  chrome
    # set window size
    Maximize Browser Window
    Set Selenium Speed  0
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

Locked Out Login    
    # open browser
    Open Browser    https://www.saucedemo.com/  chrome
    # set window size
    Maximize Browser Window
    Set Selenium Speed  0
    # check if in login page
    Page Should Contain Element     login-button
    # input username
    Input Text  user-name   locked_out_user
    # input password
    Input Password  password    secret_sauce
    # click login button
    Click Button    login-button
    # Error message
    Element Text Should Be      xpath://*[@id="login_button_container"]/div/form/div[3]/h3     Epic sadface: Sorry, this user has been locked out.
    # close browser
    [Teardown]  Close Browser

Wrong Password Login    
    # open browser
    Open Browser    https://www.saucedemo.com/  chrome
    # set window size
    Maximize Browser Window
    Set Selenium Speed  0
    # check if in login page
    Page Should Contain Element     login-button
    # input username
    Input Text  user-name   standard_user
    # input password
    Input Password  password    secret_sauce123
    # click login button
    Click Button    login-button
    # Error message
    Element Text Should Be      xpath://*[@id="login_button_container"]/div/form/div[3]/h3     Epic sadface: Username and password do not match any user in this service
    # close browser
    [Teardown]  Close Browser

Broken Inventory Login    
    # open browser
    Open Browser    https://www.saucedemo.com/  chrome
    # set window size
    Maximize Browser Window
    Set Selenium Speed  0
    # check if in login page
    Page Should Contain Element     login-button
    # input username
    Input Text  user-name   problem_user
    # input password
    Input Password  password    secret_sauce
    # click login button
    Click Button    login-button
    # Error image
    Page Should Contain Image    /static/media/sl-404.168b1cce.jpg
    # close browser
    [Teardown]  Close Browser

Sort Product Name (A to Z)  
    # open browser
    Open Browser    https://www.saucedemo.com/  chrome
    # set window size
    Maximize Browser Window
    Set Selenium Speed  0
    # check if in login page
    Page Should Contain Element     login-button
    # input username
    Input Text  user-name   standard_user
    # input password
    Input Password  password    secret_sauce
    # click login button
    Click Button    login-button
    # select A to Z option from filter
    Select From List By Value    class:product_sort_container   az
    # check if filter option displays the correct filter chosen
    Element Text Should Be      class:active_option     NAME (A TO Z)
    # close browser
    [Teardown]  Close Browser

Sort Product Name (Z to A)  
    # open browser
    Open Browser    https://www.saucedemo.com/  chrome
    # set window size
    Maximize Browser Window
    Set Selenium Speed  0
    # check if in login page
    Page Should Contain Element     login-button
    # input username
    Input Text  user-name   standard_user
    # input password
    Input Password  password    secret_sauce
    # click login button
    Click Button    login-button
    # select Z to A option from filter
    Select From List By Value    class:product_sort_container   za
    # check if filter option displays the correct filter chosen
    Element Text Should Be      class:active_option     NAME (Z TO A)
    # close browser
    [Teardown]  Close Browser

Sort Product Price (low to high)  
    # open browser
    Open Browser    https://www.saucedemo.com/  chrome
    # set window size
    Maximize Browser Window
    Set Selenium Speed  0
    # check if in login page
    Page Should Contain Element     login-button
    # input username
    Input Text  user-name   standard_user
    # input password
    Input Password  password    secret_sauce
    # click login button
    Click Button    login-button
    # select low to high option from filter
    Select From List By Value    class:product_sort_container   lohi
    # check if filter option displays the correct filter chosen
    Element Text Should Be      class:active_option     PRICE (LOW TO HIGH)
    # close browser
    [Teardown]  Close Browser

Sort Product Price (high to low)  
    # open browser
    Open Browser    https://www.saucedemo.com/  chrome
    # set window size
    Maximize Browser Window
    Set Selenium Speed  0
    # check if in login page
    Page Should Contain Element     login-button
    # input username
    Input Text  user-name   standard_user
    # input password
    Input Password  password    secret_sauce
    # click login button
    Click Button    login-button
    # select high to low option from filter
    Select From List By Value    class:product_sort_container   hilo
    # check if filter option displays the correct filter chosen
    Element Text Should Be      class:active_option     PRICE (HIGH TO LOW)
    # close browser
    [Teardown]  Close Browser
    