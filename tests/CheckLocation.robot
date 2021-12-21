*** Settings ***
Documentation     Feature: Returning location data based on country and zip code
...	As a consumer of the Zippopotam.us API.
...	I want to receive location data matching the country code and zip code I supply.
...	So I can use this data to auto-complete forms on my web site.

Library           Collections
Library           RequestsLibrary

*** Variables ***
${url}           http://api.zippopotam.us
${country}       us
${zipcode}       90210

*** Test Cases ***
An existing country and zip code yields the correct place name (traditional keyword driven test case)
    [Documentation]    Check that the correct place name is returned for an existing country and zip code
    ${response}=    GET    ${url}/${country}/${zipcode}
    Status Should Be    200
    Should Be Equal As Strings    ${response.json()['places'][0]['place name']}    Beverly Hills
    Should Be Equal As Strings    ${response.json()['places'][0]['state']}    California

An existing country and zip code yields the correct place name (keyword driven test case with positional arguments, hiding low level keywords)
    [Documentation]    Check that the correct place name is returned for an existing country and zip code
	Set the country code and zip code    us    90210
	Request the locations corresponding to these codes
  	The response has status code    200
	The response contains the place name    Beverly Hills
	The response contains the state    California

An existing country and zip code yields the correct place name (keyword driven test case with arguments embedded in keywords, hiding low level keywords)
    [Documentation]    Check that the correct place name is returned for an existing country and zip code
	Set the country code 'us' and zip code '90210'
	Request the locations corresponding to these codes
	The response has status code '200'
	The response contains the place name 'Beverly Hills'
	The response contains the state 'California'

Scenario: An existing country and zip code yields the correct place name (BDD test case)
	Given the country code 'us' and zip code '90210'
	When I request the locations corresponding to these codes
	Then the response has status code '200'
	And the response contains the place name 'Beverly Hills'
	And the response contains the state 'California'

*** Keywords ***
# Keywords with positional arguments
Set the country code and zip code
    [Arguments]    ${country_code}    ${zip_code}
    Set Test Variable    ${COUNTRY_CODE}    ${country_code}
    Set Test Variable    ${ZIP_CODE}    ${zip_code}

The response has status code
    [Arguments]    ${status_code}
    Status Should Be    ${status_code}

The response contains the place name
    [Arguments]    ${place_name}
    Should Be Equal As Strings    ${Response.json()['places'][0]['place name']}    ${place_name}

The response contains the state
    [Arguments]    ${state_name}
    Should Be Equal As Strings    ${Response.json()['places'][0]['state']}    ${state_name}

# Keywords with embedded arguments
Set the country code '${country_code}' and zip code '${zip_code}'
    Set Test Variable    ${COUNTRY_CODE}    ${country_code}
    Set Test Variable    ${ZIP_CODE}    ${zip_code}

Request the locations corresponding to these codes
    ${response}=    GET    ${url}/${COUNTRY_CODE}/${ZIP_CODE}
    Set Test Variable    ${Response}    ${response}

# Gherkin keywords with embedded arguments
The country code '${country_code}' and zip code '${zip_code}'
    Set Test Variable    ${COUNTRY_CODE}    ${country_code}
    Set Test Variable    ${ZIP_CODE}    ${zip_code}

I request the locations corresponding to these codes
    ${response}=    GET    ${url}/${COUNTRY_CODE}/${ZIP_CODE}
    Set Test Variable    ${Response}    ${response}

The response has status code '${status_code}'
    Status Should Be    ${status_code}

The response contains the place name '${place_name}'
    Should Be Equal As Strings    ${Response.json()['places'][0]['place name']}    ${place_name}

The response contains the state '${state_name}'
    Should Be Equal As Strings    ${Response.json()['places'][0]['state']}    ${state_name}
