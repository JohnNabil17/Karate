Feature: To create the product entry in the application
	Use POST /products/add to create product entry in the application
	
	Background: Create and initialize base url
		Given url 'https://dummyjson.com'
		
	Scenario: To create the product entry in JSON format
		Given path '/products/add'
		And request {"id": 131,"title": "Bad Title","description": "Bad des","price": 10,"discountPercentage": 10.00,"rating": 10.00,"stock": 10,"stocks": 20,"brand": "Bad brand","category": "Bad category","thumbnail": "https://i.dummyjson.com/data/products/1/thumbnail.jpg","images": ["https://i.dummyjson.com/data/products/1/1.jpg","https://i.dummyjson.com/data/products/1/2.jpg","https://i.dummyjson.com/data/products/1/3.jpg","https://i.dummyjson.com/data/products/1/4.jpg","https://i.dummyjson.com/data/products/1/thumbnail.jpg"]}
		And headers {Accept:'application/json' , Content-Type:'application/json'}
		When method post
		And status 200
		Then print response
		And match response.title == "Bad Title"
		
	Scenario: To create the product entry in JSON format
		Given path '/products/add'
		* def body = read("data/productEntry.json")
		And request body
		And headers {Accept:'application/json' , Content-Type:'application/json'}
		When method post
		And status 200
		Then print response
		And match response.title == "Bad Title"
		
	Scenario: To create the product entry in JSON format with embedded expression
		Given path '/products/add'
		* def getProductID = function(){return Math.floor((100) * Math.random());}
		And request {"id": '#(getProductID())',"title": "Bad Title","description": "Bad des","price": 10,"discountPercentage": 10.00,"rating": 10.00,"stock": 10,"stocks": 20,"brand": "Bad brand","category": "Bad category","thumbnail": "https://i.dummyjson.com/data/products/1/thumbnail.jpg","images": ["https://i.dummyjson.com/data/products/1/1.jpg","https://i.dummyjson.com/data/products/1/2.jpg","https://i.dummyjson.com/data/products/1/3.jpg","https://i.dummyjson.com/data/products/1/4.jpg","https://i.dummyjson.com/data/products/1/thumbnail.jpg"]}
		And headers {Accept:'application/json' , Content-Type:'application/json'}
		When method post
		And status 200
		Then print response
		And match response.title == "Bad Title"
		