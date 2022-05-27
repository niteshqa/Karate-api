Feature: sample get end-point

  Background:
    * url 'https://reqres.in'
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

