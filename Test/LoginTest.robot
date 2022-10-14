*** Settings ***
Resource    ../Steps/LoginSteps.robot

Test Setup    Given abrir aplicacio DemoWeb

*** Test Cases ***
Scenario: Como usuario valido la navegacion hacia la vista login
    Scenario: validar navegacion a vista login

Scenanario: Como usuario realizo un login correcto
    Scenanario: validar login correcto

*** Keywords ***
Scenario: validar navegacion a vista login
    ##Given abrir aplicacio DemoWeb
    When dar click en menu inicial
    And dar click al login en el menu
    then validar si texto login es correcto

Scenanario: validar login correcto
    When dar click en menu inicial
    And dar click al login en el menu
    And escribir usuario en login
    And escribir password oculto en login
    And dar click en el boton de loggin en la vista loggin
    Then validar que se redirija correctamente a la vista de compras