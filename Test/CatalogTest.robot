*** Settings ***
Resource    ../Steps/CatalogSteps.robot

Test Setup    Given abrir aplicacion DemoWeb


*** Test Cases ***
Scenanario: Validar que el articulo Labs Backpack este contenido en la lista de catalogos
    Scenario: como usuario valido si la palabra Labs Backpack esta en el catalogos

*** Keywords ***
Scenario: como usuario valido si la palabra Labs Backpack esta en el catalogos
    Then validar que el texto Sauce Labs Backpack este en el catalogo 