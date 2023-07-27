@Regression @Confidence
Feature: To test the Get end point with Query Parameter

	Background: Create and Initialize base Url
		Given url 'https://jsonplaceholder.typicode.com'
		
	Scenario: To get the data using Query Param
		# Create the user entry
		# Get the newly created user entry using Query Param
		* def getRandomValue = function(){return Math.floor((100) * Math.random());}
  	* def createdUserId = getRandomValue()
  	* def createUser = call read("../../createUserEntryWithVariables.feature") {_url: 'https://jsonplaceholder.typicode.com', _path: '/posts', _userId: '#(createdUserId)'}
  	# Send the Get request with query param
  	Given path '/comments'
  	#And param postId = createdUserId
  	#And param id = 101
  	And params {postId : '#(createdUserId)' , id : '101'}
		And headers {Accept:'application/json' , Content-Type:'application/json'}
  	When method get
  	Then status 200
		#And match response.postId == createdUserId
	
