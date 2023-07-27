Feature: To test the patch end point for updating the job description
	PATCH /posts/1
	
	Background: Create and initialize base url
		Given url 'https://jsonplaceholder.typicode.com'
		
@Smoke @Regression		
	Scenario: To update the user description for newly added user entry
		# Create the user entry
		# Using the patch request, update the uer description of newly added user entry
		* def getRandomValue = function(){return Math.floor((100) * Math.random());}
		* def createdUserId = getRandomValue()
		* def createUser = call read("../createUserEntryWithVariables.feature") {_url:'https://jsonplaceholder.typicode.com', _path: '/posts', _userId: '#(createdUserId)'}
		#PATCH request
		Given path '/posts/1'
		#And params {userId: '#(createdUserId)',id: '1',title: 'new title'}
		And request {"title" : "new title"}
		And header Accept = 'application/json'
		When method patch
		Then status 200
		And match response.title == "new title"