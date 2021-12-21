*** Settings ***
Documentation     Feature: Returning location data based on country and zip code.
...	As a consumer of the Zippopotam.us API.
...	I want to receive location data matching the country code and zip code I supply.
...	So I can use this data to auto-complete forms on my web site.

Resource          ../resources/gherkin_keywords_location_resource.robot

*** Test Cases ***
Scenario: An existing country and zip code yields the correct place name
    [Tags]     SmokeTest    NightTest
    Given the country code 'us' and zip code '90210'
    When I request the locations corresponding to these codes
    Then the response contains the place name 'Beverly Hills'

Scenario: An existing country and zip code yields the correct state name
    [Tags]     SmokeTest    NightTest
    Given the country code 'us' and zip code '90210'
    When I request the locations corresponding to these codes
    Then the response contains the state 'California'

Scenario: An existing country and zip code yields the correct number of results
    [Tags]     SmokeTest    NightTest
    Given the country code 'us' and zip code '90210'
    When I request the locations corresponding to these codes
    Then the response contains exactly '1' location

Scenario: An existing country and zip code yields the correct HTTP status code
    [Tags]     SmokeTest    NightTest
    Given the country code 'us' and zip code '90210'
    When I request the locations corresponding to these codes
    Then the response has status code '200'

Scenario: A not existing country and zip code yields the correct HTTP status code
    [Tags]    NightTest
    Given the country code 'xx' and zip code '90210'
    When I request the locations corresponding to these codes
    Then the response has status code '404'

Scenario: An existing country and not existing zip code yields the correct HTTP status code
    [Tags]    NightTest
    Given the country code 'nl' and zip code '0000'
    When I request the locations corresponding to these codes
    Then the response has status code '404'
