@ignore
Feature: To use the JSON path expression

	Background: Create and initialize base url
    Given url 'https://dummyjson.com'
    
  Scenario: To get the value of property using json path expression
  	Given path '/products'
  	When method get
  	Then status 200
  	# karate.jsonPath(doc,jsonPathExpression)
  	* def title = karate.jsonPath(response, "$.products[:1].title")
  	* def description = karate.jsonPath(response, "$.products[:1].description")
  	* def price = karate.jsonPath(response, "$.products[:1].price")
  	And print "title ==>" , title
  	And print "description ==>" , description
  	And print "price ==>" , price
		