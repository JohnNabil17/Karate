Feature: To create the user entry in the test application
	Helper for POST /posts
	
	Scenario: To create the user entry with JSON data
	Given url 'https://jsonplaceholder.typicode.com'
	And path '/posts'
    * def getRandomValue = function(){return Math.floor((100) * Math.random());}
    * def userId = getRandomValue()
    And request {"userId": '#(userId)',"id": 102,"title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit","body": "Fifty"}
    And headers {Accept:'application/json' , Content-Type:'application/json'}
    When method post
    And status 201

