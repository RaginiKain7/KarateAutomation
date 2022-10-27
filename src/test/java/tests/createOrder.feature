Feature: Create Order in Magento using Add Purchase post api

  Background: 
    * url 'https://kera-ae.cnnbsolutions.com'
    * def random_string =
      """
      	function(s){
      		var text = "";
      		var pattern = "123456789";
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

  Scenario: Create an order
    Given path '/rest/V1/order/CreateSalesOrder/'
    And request requestPayload
    And header Authorization = 'Bearer ' + tokenID
    When method post
    And print response
    Then status 200
    