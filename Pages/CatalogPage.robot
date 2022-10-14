*** Settings ***
Resource    BasePage.robot

*** Variables ***
${locatorCatalogo}    class=android.widget.TextView

*** Keywords ***
abrir aplicacion
    abrir aplicacion base    Android    emulator-5554    com.saucelabs.mydemoapp.rn    com.saucelabs.mydemoapp.rn.MainActivity    UiAutomator2

obtener lista de articulos
    ${lista}=    obtenerVariosElementos    ${locatorCatalogo}
    [Return]    ${lista}