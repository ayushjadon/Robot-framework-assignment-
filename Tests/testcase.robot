*** settings ***
Library   SeleniumLibrary

*** Test Cases ***
Observe user is able to test sanity flow
    [Tags]  sanity 
    Given User launch browser for flipkart 
    User enter username and password than login
    goto electronics options 
    select powerbank
    pick product mi powerbank
    add product to cart
    go back to homepage
    check item in cart

Observe user is able to test regression flow
    [Tags]  regression
    Given User launch browser for flipkart store 
    # when User Land on homepage
    Then User input user name
    select powerbank
    pick product mi powerbank
    add product to kart
    go back to homepage
    check item in cart

*** keywords ***
User Launch browser for flipkart
    Open Browser  ${url}  ${browser}
    Maximize Browser Window
    
    sleep  2
    
User enter username and password than login
    input text  ${username}  ${input username}
    Input Password  ${password}  ${input password}
    sleep  2
    Click Button  ${login}
    sleep  2
goto electronics options
    Scroll Element Into View  ${electronics}
    sleep  2
select powerbank
    Mouse Down  xpath://*[@id="container"]/div/div[2]/div/div/div[5]/a/div[2]/div[2]/div[2]/div/div/div[1]/a[9]
    sleep  1
    Mouse Over  xpath://*[@id="container"]/div/div[2]/div/div/div[5]/a/div[2]/div[2]/div[2]/div/div/div[2]/a[2]
    sleep  1
    Scroll Element Into View  xpath://*[@id="container"]/div/div[2]/div/div/div[5]/a/div[2]/div[2]/div[2]/div/div/div[2]/a[2]
pick product mi powerbank
    Click Element  xpath://*[@id="container"]/div/div[2]/div/div/div[5]/a/div[2]/div[2]/div[2]/div/div/div[2]/a[2]
    sleep  1
    Mouse Down On Link  xpath://*[@id="container"]/div/div[3]/div[1]/div[2]/div[2]/div/div[3]/div/a[2]
    sleep  1
    Click Element  ${select mi powerbank}
    sleep  1
    Switch Window  locator=NEW
    sleep  1
add product to cart
    Click Button  ${add item}
    sleep  2
go back to homepage
    click Element  ${back to homepage}
    sleep  2
check item in cart
    click Element  ${item in cart}
    sleep  1
   
*** variables ***
${url} =  https://www.flipkart.com/
${browser} =  gc
${username} =  xpath://*[@class='_2IX_2- VJZDxU']
${input username} =  8076606282
${password} =  xpath://*[@class='_2IX_2- _3mctLh VJZDxU']
${input password} =  Ayush671029
${login} =  xpath://*[@class='_2KpZ6l _2HKlqd _3AWRsL']
${electronics} =  xpath://body/div[@id='container']/div[1]/div[2]/div[1]/div[1]/div[5]/a[1]/div[1]/div[1]/img[1]
${select mi powerbank} =  xpath://*[@id="container"]/div/div[3]/div[1]/div[2]/div[2]/div/div[3]/div/a[2]
${add item} =  xpath://*[@id="container"]/div/div[3]/div[1]/div[1]/div[2]/div/ul/li[1]/button
${back to homepage} =  xpath://*[@id="container"]/div/div[1]/div[1]/div[2]/div[1]/div/a[1]/img
${item in cart} =  xpath://*[@id="container"]/div/div[1]/div[1]/div[2]/div[5]/div/div/a/span
