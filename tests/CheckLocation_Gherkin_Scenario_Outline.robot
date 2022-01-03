*** Settings ***
Documentation     Feature: Returning location data based on country and zip code.
...	As a consumer of the Zippopotam.us API.
...	I want to receive location data matching the country code and zip code I supply.
...	So I can use this data to auto-complete forms on my web site.
...	
...	This test suite contains 2 methods to implement a Scenario Outline.
...	Note that Robot Framework does not support Scenario outlines as it is defined in the Gherkin language


Test Template     Scenario: Existing country '${country}' and zip code '${zip_code}' yields the correct place name '${place_name}'

Resource          ../resources/gherkin_keywords.resource

*** Test Cases ***
Scenario Outline: Existing country and zip code yields the correct place names
#   country    zip code    place name
    us         90210       Beverly Hills
    ca         B3M         Halifax Bedford Basin
    nl         5653        Eindhoven

Country 'us', zip code '90210', place name 'Beverly Hills'
    [Tags]    SmokeTest
    us         90210       Beverly Hills

Country 'ca', zip code 'B3M', place name 'Halifax Bedford Basin'
    [Tags]    SmokeTest    NightTest
    ca         B3M         Halifax Bedford Basin

Country 'nl', zip code '5653', place name 'Eindhoven'
    [Tags]    NightTest
    nl         5653        Eindhoven

Country 'nl', zip code '6851', place name 'Huissen'
    [Tags]    NightTest
    nl         6851        Huissen

Country 'de', zip code '01067', place name 'Dresden'
    [Tags]    NightTest
    de         01067       Dresden

Country 'de', zip code '01067', place name 'Dresden Friedrichstadt'
    [Tags]    NightTest
    de         01067       Dresden Friedrichstadt

Country 'de', zip code '01067', place name 'Dresden Innere Altstadt'
    [Tags]    NightTest
    de         01067       Dresden Innere Altstadt


*** Keywords ***
Scenario: Existing country '${country}' and zip code '${zip_code}' yields the correct place name '${place_name}'
    Given the country code '${country}' and zip code '${zip_code}'
    When I request the locations corresponding to these codes
    Then the response has status code '200'
    And the response contains the place name '${place_name}'

