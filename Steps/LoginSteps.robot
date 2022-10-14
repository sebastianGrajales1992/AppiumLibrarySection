*** Settings ***
Resource    ../Pages/LoginPage.robot


*** Keywords ***
abrir aplicacio DemoWeb
    abrir aplicacion

dar click en menu inicial
    click boton abrir menu

dar click al login en el menu
    click boton ingresar login

validar si texto login es correcto
    ${titulo}    obtener texto titulo login
    Should Be Equal    ${titulo}    Login

escribir usuario en login
    escribir usuario    bob@example.com

escribir password oculto en login
    escribir contraseña en el login    10203040

dar click en el boton de loggin en la vista loggin
    dar click en el boton loggear

validar que se redirija correctamente a la vista de compras
    ${titulo} =    obtener texto titulo de compras
    Should Be Equal    ${titulo}    Products