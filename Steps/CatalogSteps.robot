*** Settings ***
Resource    ../Pages/CatalogPage.robot
Library    Collections

*** Keywords ***

abrir aplicacion DemoWeb
    abrir aplicacion

validar que el texto Sauce Labs Backpack este en el catalogo
    ${elementos}    obtener lista de articulos
    ${texto_Elementos}    Create List
    FOR    ${elemento}    IN    @{elementos}
        ${textoElemento}    Get Text    ${elemento}
        Append To List    ${texto_Elementos}    ${textoElemento}
    END
    Should Contain    ${texto_Elementos}    Sauce Labs Backpack