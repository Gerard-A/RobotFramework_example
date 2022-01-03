*** Settings ***
Library           Collections
Library           RequestsLibrary

*** Variables ****
${Url}       http://api.zippopotam.us
${index}     0

*** Keywords ***
The country code '${country_code}' and zip code '${zip_code}'
    Set Test Variable    ${COUNTRY_CODE}    ${country_code}
    Set Test Variable    ${ZIP_CODE}    ${zip_code}

I request the locations corresponding to these codes
    ${response}=    GET    ${Url}/${COUNTRY_CODE}/${ZIP_CODE}    expected_status=any
    Set Test Variable    ${Response}    ${response}

The response has status code '${status_code}'
    Status Should Be    ${status_code}

The response contains the place name '${place_name}'
    ${PlaceName}=    Create List    ${place_name}
    ${Places}=    Create List
    ${actual_nr_of_locations}=    Get Length    ${Response.json()['places']}
    FOR    ${index}    IN RANGE    ${actual_nr_of_locations}
        LOG    ${Response.json()['places'][${index}]['place name']}
        ${Place}=     Create List    ${Response.json()['places'][${index}]['place name']}
        Append To List    ${Places}    ${Place}
        LOG    ${Places}
    END
    List Should Contain Value    ${Places}    ${PlaceName}

The response contains the state '${state_name}'
    Should Be Equal As Strings    ${Response.json()['places'][0]['state']}    ${state_name}

The response contains exactly '${number_of_locations}' location
    ${actual_nr_of_locations}=    Get Length    ${Response.json()['places']}
    Should Be Equal As Integers    ${actual_nr_of_locations}    ${number_of_locations}

The response contains exactly '${number_of_locations}' locations
    The response contains exactly '${number_of_locations}' location