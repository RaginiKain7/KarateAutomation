Feature: Get Token Tests

  Background: 
    * url 'https://kera-ae.cnnbsolutions.com'
    * header Accept = 'application/json'

  Scenario: Get the token from the API
    Given path '/rest/V1/integration/admin/token'
    And def requestBody = read('requestForGetTokenAPI.json')
    And print requestBody
    And request requestBody
    When method post
    Then status 200
    And print response
    And print responseStatus
    And print responseTime
    And print responseHeaders
    And print responseCookies
    And match response != null
    
    * def response = response.token
