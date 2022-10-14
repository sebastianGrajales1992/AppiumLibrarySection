*** Settings ***
Library    AppiumLibrary


*** Keywords ***
abrir aplicacion base
    [Arguments]    ${plataforma}    ${nombre_dispositivo}    ${app_package}    ${app_activity}    ${automation_name}
    Open Application    http://localhost:4723/wd/hub    platformName=${plataforma}    deviceName=${nombre_dispositivo}    appPackage=${app_package}    appActivity=${app_activity}    automationName=${automation_name}

obtener elemento
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    10s
    ${elemento}    Get Webelement    ${locator}
    [Return]    ${elemento}

click
    [Arguments]     ${locator}
    ${elemento}    obtener elemento    ${locator}
    Click Element  ${elemento}

escribir en un elemento
    [Arguments]     ${locator}    ${valor}
    ${elemento}    obtener elemento    ${locator}
    Clear Text    ${elemento}
    Input Text    ${elemento}    ${valor}

escribir contraseña
    [Arguments]     ${locator}    ${valor}
    ${elemento}    obtener elemento    ${locator}
    Clear Text    ${elemento}
    Input Text    ${elemento}    ${valor}

obtenerVariosElementos
    [Arguments]     ${locator}
    ${elementos} =    Get Webelements    ${locator}
    [Return]    ${elementos}

obtener texto de un elemento
    [Arguments]    ${locator}
    ${elemento}    obtener elemento    ${locator}
    ${texto_elemento}    Get Text    ${elemento}
    [Return]    ${texto_elemento}