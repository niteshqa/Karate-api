Feature: sample POST end-point

  Background:
    * url 'https://reqres.in'
    * configure logPrettyRequest = true
    * configure logPrettyResponse = true
    * configure headers = {'Content-Type' : 'application/json'}
    * configure headers = {'Accept' : 'application/json'}
    * call read("../../resources/commonUtils.js")

    # to test a post response array ( this endpoint will not work)
 @sample
  Scenario Outline: I want to validate success response from api
    Given path '/api/users?page=2'
    And param id = '123'
    And request {"name": "<exp>"}
    When method post
    Then status <status>
    And match response.view[*].aggregation[*].level == [<value>]
    And match response.view[*].aggregation[*].value == [#notnull]
    Examples:
      | exp  |value | status |
      | abc  | 1    | 200    |

# to test a post response array ( this endpoint will not work)
  @sample
  Scenario Outline: I want to validate api
    * def payload = read ("data/request.json")
    * def preCall = call read ('dummy.feature')
    Given path '/api/users?page=2'
    And param id = '123'
    And request {"name": "<exp>"}
    When method post
    Then status <status>
    And match response.view[*].aggregation[*].level == [<value>]
    And match response.view[*].aggregation[*].value == [#notnull]
    Examples:
      | exp  |value | status |
      | abc  | 1    | 201    |

