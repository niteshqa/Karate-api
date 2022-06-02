Feature: sample POST end-point

  Background:
    * url 'https://reqres.in'
    * configure logPrettyRequest = true
    * configure logPrettyResponse = true
    * configure headers = {'Content-Type' : 'application/json'}
    * configure headers = {'Accept' : 'application/json'}

    # to test a post response array ( this endpoint will not work)
  Scenario : I want to validate success response from api
    Given path '/api/users?page=2'
    When method get
    Then status 200



