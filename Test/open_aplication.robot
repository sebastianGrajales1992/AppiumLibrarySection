*** Settings ***
Library    AppiumLibrary
Library    Collections

*** Variables ***
${locatorMenuPrincipal}    class=android.widget.ImageView
${locatorButtonLogin}    //android.widget.TextView[@text="Log In"]
${locatorTituloLogin}    //android.widget.TextView[@text="Login"]
${locatorUserName}    //android.widget.EditText[@index=3]
${locatorPassword}    //android.widget.EditText[@index=6]
${locatorLoginSubmit}    //android.view.ViewGroup[@index=9]
${LocatorTituloPaginaLoginCorrecto}    //android.widget.TextView[@text="Products"]
${LocatorErrorLogin}    //android.widget.TextView[@text="Provided credentials do not match any user in this service." and @index="0"]
${locatorNoItems}    //android.widget.TextView[@text="No Items"]
${locator_usuario_bloqueado}    //android.widget.TextView[@text="Sorry, this user has been locked out."]

*** Test Cases ***
validar vista login
    Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=emulator-5554    appPackage=com.saucelabs.mydemoapp.rn    appActivity=com.saucelabs.mydemoapp.rn.MainActivity    automationName=UiAutomator2
    Sleep    3s
    Click Element    ${locatorMenuPrincipal}
    Click Element    ${locatorButtonLogin}
    Sleep    2s
    ${login} =    Get Text    ${locatorTituloLogin}
    Should Be Equal    ${login}    Login

validar login correcto
    Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=emulator-5554    appPackage=com.saucelabs.mydemoapp.rn    appActivity=com.saucelabs.mydemoapp.rn.MainActivity    automationName=UiAutomator2
    Sleep    2s
    Click Element    ${locatorMenuPrincipal}
    Sleep    1s
    Click Element    ${locatorButtonLogin}
    Sleep    2s
    Input Text    ${locatorUserName}    bob@example.com
    Input Password    ${locatorPassword}    10203040
    Click Element    ${locatorLoginSubmit}
    Sleep    1s
    Wait Until Page Contains Element    ${LocatorTituloPaginaLoginCorrecto}

validar login erroneo
    Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=emulator-5554    appPackage=com.saucelabs.mydemoapp.rn    appActivity=com.saucelabs.mydemoapp.rn.MainActivity    automationName=UiAutomator2
    Sleep    2s
    Click Element    ${locatorMenuPrincipal}
    Sleep    1s
    Click Element    ${locatorButtonLogin}
    Sleep    2s
    Input Text    ${locatorUserName}    sebastian@example.com
    Input Password    ${locatorPassword}    1234567
    Click Element    ${locatorLoginSubmit}
    Sleep    1s
    Wait Until Page Contains Element    ${LocatorErrorLogin}

validar login erroneo webElement
    Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=emulator-5554    appPackage=com.saucelabs.mydemoapp.rn    appActivity=com.saucelabs.mydemoapp.rn.MainActivity    automationName=UiAutomator2
    Sleep    3s
    Click Element    ${locatorMenuPrincipal}
    Sleep    1s
    Click Element    ${locatorButtonLogin}
    Sleep    2s
    Input Text    ${locatorUserName}    sebastian@example.com
    Input Password    ${locatorPassword}    1234567
    ${botonLogin} =    Get Webelement    ${locatorLoginSubmit}
    Click Element    ${botonLogin}
    Sleep    1s
    Wait Until Page Contains Element    ${LocatorErrorLogin}


validar muestra no items al intentar hacer loggin cuando ya estamos loggeados
    Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=emulator-5554    appPackage=com.saucelabs.mydemoapp.rn    appActivity=com.saucelabs.mydemoapp.rn.MainActivity    automationName=UiAutomator2
    Sleep    2s
    Click Element    ${locatorMenuPrincipal}
    Sleep    1s
    Click Element    ${locatorButtonLogin}
    Sleep    2s
    Input Text    ${locatorUserName}    bob@example.com
    Input Password    ${locatorPassword}    10203040
    Click Element    ${locatorLoginSubmit}
    Sleep    1s
    Click Element    ${locatorMenuPrincipal}
    Sleep    1s
    Click Element    ${locatorButtonLogin}
    Sleep    1
    Wait Until Page Contains Element    ${locatorNoItems}
    

validar si la palabra backpack esta disponible en la lista de articulo
    Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=emulator-5554    appPackage=com.saucelabs.mydemoapp.rn    appActivity=com.saucelabs.mydemoapp.rn.MainActivity    automationName=UiAutomator2
    ${elementos} =    Get Webelements    class=android.widget.TextView
    ${texto_Elementos}    Create List
    FOR    ${elemento}    IN    @{elementos}
        ${textoElemento}    Get Text    ${elemento}
        Append To List    ${texto_Elementos}    ${textoElemento}
    END
    Should Contain    ${texto_Elementos}    Sauce Labs Backpack

Hacer login con usuario valido
    usuario incorrecto


*** Keywords ***
usuario incorrecto
    Open Application    http://localhost:4723/wd/hub    platformName=Android    deviceName=emulator-5554    appPackage=com.saucelabs.mydemoapp.rn    appActivity=com.saucelabs.mydemoapp.rn.MainActivity    automationName=UiAutomator2
    Wait Until Element Is Visible    ${locatorMenuPrincipal}    10s
    Click Element    ${locatorMenuPrincipal}
    Wait Until Element Is Visible    ${locatorButtonLogin}    10s
    Click Element    ${locatorButtonLogin}
    Wait Until Element Is Visible    ${locatorUserName}    10s
    Input Text    ${locatorUserName}    alice@example.com
    Input Password    ${locatorPassword}    10203040
    Click Element    ${locatorLoginSubmit}
    ${usuario_no_existe}    Run Keyword And Return Status    Wait Until Element Is Visible    ${locator_usuario_bloqueado}    10s
    Run Keyword If    ${usuario_no_existe} == True
    ...    limpiar campos    
        usuario correcto

limpiar campos
    Clear Text    ${locatorUserName}
    Clear Text    ${locatorPassword}

usuario correcto
    Input Text    ${locatorUserName}    bob@example.com
    Input Password    ${locatorPassword}    10203040
    Click Element    ${locatorLoginSubmit}
    Sleep    1s
    Wait Until Page Contains Element    ${LocatorTituloPaginaLoginCorrecto}