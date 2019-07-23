*** Settings ***
Library           Selenium2Library
Library           Screenshot    screenshot_module=wxPython

Suite Setup      Log    Inside Suite setup
Suite Teardown   Log    Inside Suite teardown
Test Setup    Log    Inside Test setup
Test Teardown    Log    Inside Test teardown

Default Tags  Sanity

*** Variables ***
${url}            http://www.youtube.com
@{credentials}    jlansj@hotmail.com    riccuj9YouTube

*** Test Cases ***
FirstTest
    [Tags]  Smoke
    Log     First Test
SecondTest
    Log     Second Test
    Set Tags    regession2
    Remove Tags   regession2
ThirdTest
    Log     Thirs Test

test001
    [Tags]    test001
    Screenshot.Set Screenshot Directory    C:\\Users\\jeroen\\Documents\\PythonScripts\\Screenshots
    Open Browser    ${url}    ff
    Click Element    //*[contains(text(),'Begrepen')]
    Click Element    //paper-button[@id='button' and @aria-label='Inloggen']
    #    Click Link    https://accounts.google.com/ServiceLogin?service=youtube&uilel=3&passive=true&continue=https%3A%2F%2Fwww.youtube.com%2Fsignin%3Faction_handle_signin%3Dtrue%26app%3Ddesktop%26hl%3Dnl%26next%3D%252F&hl=nl
    Input Text    //*[@id="identifierId"]    jlansj@hotmail.com
    Click Element    //span[@class="RveJvd snByac"]
    Wait Until Element Is Visible    //input[@type="password"]    30
    Input Text    //input[@type="password"]    riccuj9YouTube
    Click Element    //span[@class="RveJvd snByac"]
    Wait Until Element Is Visible    //*[@id="guide-section-title" and contains(text(),'Meer van YouTube')]    30
    ClickElement    //*[@id="guide-section-title" and contains(text(),'Meer van YouTube')]
    Log To Console    clicked meer
    Click Element    //span[@class='title style-scope ytd-guide-entry-renderer' and contains(text(), 'Trending')]
    Take Screenshot Without Embedding
    Log To Console    Clicked Trending
    Sleep    5s
    Click Element    //span[@class='title style-scope ytd-guide-entry-renderer' and contains(text(), 'Abonnementen')]
    Take Screenshot Without Embedding
    Sleep    5s
    Click Element    //span[@class='title style-scope ytd-guide-entry-renderer' and contains(text(), 'Bibliotheek')]
    Take Screenshot Without Embedding
    Sleep    5s
    Click Element    //span[@class='title style-scope ytd-guide-entry-renderer' and contains(text(), 'Geschiedenis')]
    Take Screenshot Without Embedding
    Sleep    5s
    Click Element    //span[@class='title style-scope ytd-guide-entry-renderer' and contains(text(), 'Later bekijken')]
    Take Screenshot Without Embedding
    Sleep    5s
    Click Element    //span[@class='title style-scope ytd-guide-entry-renderer' and contains(text(), 'Instellingen')]
    Take Screenshot Without Embedding
    Log To Console    User 1 is logged in on ${url} : test is finished voor user1
    Take Screenshot Without Embedding
    Close Browser

test002
    #    Press Keys    None    RETURN
    #    Wait Until Element Is Visible    //span[@class="title" and text()[contains(.,'Instellingen')]]    30
    #    Wait Until Element Is Visible    //span[@class="title"][2]    30
    #    Scroll Element Into View    //*[contains(text(),'Trending')]
    ClickElement    //*[@id="guide-section-title" and contains(text(),'Meer van YouTube')]
    Click Link    //*[contains(text(),'Instellingen')]
    Click Link    //span[@class="title" and text()[contains(.,'Instellingen')]]
    Log To Console    User 1 is logged in on ${url} : test is finished voor user1

test003
    [Tags]    test003
    [Setup]    Log To Console    Test case started
    Screenshot.Set Screenshot Directory    C:\\Users\\jeroen\\Documents\\PythonScripts\\Screenshots
    gotohomepage
    Login
    Take Screenshot Without Embedding
    [Teardown]    Log To Console    Test Case Completed

test004
    [Tags]    Sanity
    Log To Console    Test case test004 started
    Screenshot.Set Screenshot Directory    C:\\Users\\jeroen\\Documents\\PythonScripts\\Screenshots
    Open Browser    http://www.google.com    ff
    Take Screenshot Without Embedding
    Close Browser
    Log To Console    Test Case test004 Completed
    Set Tags    SmokeTest
    Remove Tags    SmokeTest

test005
    [Tags]    Sanity
    Log To Console    Test case test004 started
    Screenshot.Set Screenshot Directory    C:\\Users\\jeroen\\Documents\\PythonScripts\\Screenshots
    Open Browser    http://www.google.com    chrome
    Take Screenshot Without Embedding
    Close Browser
    Log To Console    Test Case test004 Completed

test006
    [Tags]    Smoke
    [Setup]    Log To Console    Test case started
    #    ("//yt-formatted-string[@id=text and @class='style-scope ytd-button-renderer style-suggestive size-small']")
    Open Browser    ${url}    ff
    Screenshot.Set Screenshot Directory    C:\\Users\\jeroen\\Documents\\PythonScripts\\Screenshots
    Login
    Take Screenshot Without Embedding
    [Teardown]    Log To Console    Test Case Completed

test007
    [Tags]    test007
    [Setup]    Log To Console    Test case started
    gotohomepage
    Take Screenshot Without Embedding
    Sleep    5s
    Click Element    //span[@class='title style-scope ytd-guide-entry-renderer' and contains(text(), 'Bibliotheek')]
    Take Screenshot Without Embedding
    Sleep    5s
    Click Element    //span[@class='title style-scope ytd-guide-entry-renderer' and contains(text(), 'Geschiedenis')]
    Take Screenshot Without Embedding
    Sleep    5s
    ## Click Element    //span[@class='title style-scope ytd-guide-entry-renderer' and contains(text(), 'Later bekijken')]
    ## Take Screenshot Without Embedding
    ## Sleep    5s
    Screenshot.Set Screenshot Directory    C:\\Users\\jeroen\\Documents\\PythonScripts\\Screenshots
    Login
    Click Element    //span[@class='title style-scope ytd-guide-entry-renderer' and contains(text(), 'Trending')]
    Take Screenshot Without Embedding
    Log To Console    Clicked Trending
    Sleep    5s
    Click Element    //span[@class='title style-scope ytd-guide-entry-renderer' and contains(text(), 'Abonnementen')]
    Click Element    //span[@class='title style-scope ytd-guide-entry-renderer' and contains(text(), 'Instellingen')]
    Take Screenshot Without Embedding
    Log To Console    User 1 is logged in on ${url} : test is finished voor user1
    Take Screenshot Without Embedding

*** Keywords ***
Login
    ### Click Element    //*[contains(text(),'Begrepen')]
    Wait Until Element Is Visible    css:paper-button#button[aria-label='Inloggen']    30
    Click Element    css:paper-button#button[aria-label='Inloggen']
    #    Input Text    //*[@id="identifierId"]    jlansj@hotmail.com
    Input Text    css:input#identifierId[aria-label='E-mailadres of telefoonnummer']    jlansj@hotmail.com
    Click Element    css:span[class='RveJvd snByac']
    Wait Until Element Is Visible    css:input[type='password'][class='whsOnd zHQkBf'][aria-label='Geef je wachtwoord op'][name='password']    30
    Input Text    css:input[type='password'][class='whsOnd zHQkBf'][aria-label='Geef je wachtwoord op'][name='password']    riccuj9YouTube
    Click Element    css:span[class='RveJvd snByac']
    Wait Until Element Is Visible    //*[@id="guide-section-title" and contains(text(),'Meer van YouTube')]    30

goToHomePage
    Open Browser    ${url}    ff

x``testje
