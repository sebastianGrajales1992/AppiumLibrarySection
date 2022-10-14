*** Settings ***
Resource    BasePage.robot


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

*** Keywords ***
abrir aplicacion
    abrir aplicacion base    Android    emulator-5554    com.saucelabs.mydemoapp.rn    com.saucelabs.mydemoapp.rn.MainActivity    UiAutomator2

click boton abrir menu
    click    ${locatorMenuPrincipal}

click boton ingresar login
    click    ${locatorButtonLogin}

obtener texto titulo login
    ${texto}    obtener texto de un elemento    ${locatorTituloLogin}
    [Return]    ${texto}

escribir usuario
    [Arguments]    ${valor}
    escribir en un elemento    ${locatorUserName}    ${valor}

escribir contraseña en el login
    [Arguments]    ${valor}
    escribir contraseña    ${locatorPassword}    ${valor}

dar click en el boton loggear
    click    ${locatorLoginSubmit}

obtener texto titulo de compras
    ${titulo}    obtener texto de un elemento    ${LocatorTituloPaginaLoginCorrecto}
    [Return]    ${titulo}
    