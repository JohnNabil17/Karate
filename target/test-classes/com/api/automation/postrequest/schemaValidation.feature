	Feature: Validate the JSON schema
  To validate the JSON schema for POST /products/add

  Background: Create and initialize base url
    Given url 'https://dummyjson.com'

  Scenario: To create the product entry in JSON format
    Given path '/products/add'
    * def body = read("data/productEntry.json")
    And request body
    And headers {Accept:'application/json' , Content-Type:'application/json'}
    When method post
    And status 200
    And match response ==
      """
      {
        "id": '#number',
        "title": '#string',
        "price": '#number',
        "stock": '#number',
        "rating": '#number',
        "images": '#[] #string',
        "thumbnail": '#string',
        "description": '#string',
        "brand": '#string',
        "category": '#string'
      }
      """
      
 	Scenario: Schema Validation for GET end point
		Given path '/products'
		And header Accept = 'application/json'
		When method get
		Then status 200
		
   	* def mainSchema = {"products": '#[] #object', "total": '#number',"skip": '#number',"limit": '#number'}
   	And match response ==
   		"""
   		'#(mainSchema)'
   		"""
