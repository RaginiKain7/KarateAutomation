Feature: Full cycle of creating an order

  Background: 
   
    * header Accept = 'application/json'
    
     * def random_string =
	"""
		function(s){
			var text = "";
			var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
			for(var i=0; i<s; i++)
				text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
				return text;
		}
	"""
    * def randomString = random_string(4)
    * print randomString	

    * def requestPayload = read('AddPurchase.json')

    * set requestPayload.payload.body.sourceOrderNumber =  "Ragini_testOrder_" + randomString

    * print requestPayload

  Scenario: Get the token from the API
    Given url baseUrl+'/rest/V1/integration/admin/token'
    And def requestBody = read('requestForGetTokenAPI.json')
    And print requestBody
    And request requestBody
    When method post
    Then status 200
    And print response
    And match response != null
    
    * def accessToken = response.token
    
  Scenario: Create a user with the given data
    Given url baseUrl+'/rest/V1/order/CreateSalesOrder/'
    And request requestPayload
    And header Authorization = 'Bearer ' + accessToken
    When method post
    Then status 200
