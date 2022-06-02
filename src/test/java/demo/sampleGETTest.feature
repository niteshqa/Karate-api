Feature: sample get end-point

  Background:
    * url baseUrl
    * configure logPrettyRequest = true
    * configure logPrettyResponse = true
    * configure headers = {'Content-Type' : 'application/json'}
    * configure headers = {'Accept' : 'application/json'}

 @new
  Scenario Outline: I want to validate success response from api
    Given path <exp>
    When method <method>
    Then status <status>
    * def expectedResponse = read ("data/getResponse.json")
    And match response == <op>
    Examples:
      | exp                 | method | status | op              |
      | '/api/users?page=2' | get    | 200    | expectedResponse|

  # sample test to validate data in json file by defining the value in scenario
  @new
  Scenario Outline: I want to validate name response from api
    * def expectedResponse = read ("data/getResponseNew.json")
    * def name = "<exp>"
    Given path '/api/users?page=2'
    When method get
    Then status 200
    And match response == expectedResponse
    Examples:
      | exp      |
      | cerulean |

