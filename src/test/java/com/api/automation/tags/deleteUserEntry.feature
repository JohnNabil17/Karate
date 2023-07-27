Feature: To test the delete end point
	DELETE
	
	Background: Create and initialize base url
		Given url 'https://jsonplaceholder.typicode.com'
@Smoke		
		Scenario: To delete the user entry from application usign user id
		# Create a new user entry
		# Delete the newly created user entry
		# Get request with query parameter and validate for 404
		* def getRandomValue = function(){return Math.floor((100) * Math.random());}
		* def createdUserId = getRandomValue()
		* def createUser = call read("../createUserEntryWithVariables.feature") {_url:'https://jsonplaceholder.typicode.com', _path: '/posts', _userId: '#(createdUserId)'}
		# delete request
		Given path '/posts/' + createdUserId
		When method delete
		Then status 200
		# Get request
		Given path '/posts' + createdUserId
		When method get
		Then status 404