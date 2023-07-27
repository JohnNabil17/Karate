Feature: To test the updation of user entry in the test application
  Test the end point PUT /posts

  Background: Create and initialize base url
    Given url 'https://jsonplaceholder.typicode.com'

  Scenario: To update the user Entry for existing user in JSON format
    # Create a new user entry
    # Update the job entry using PUT request
    # Using jsonPath verify the updation of details in user entry
    Given path '/posts'
    * def getRandomValue = function(){return Math.floor((100) * Math.random());}
    * def userId = getRandomValue()
    And request {"userId": '#(userId)',"id": 102,"title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit","body": "Fifty"}
    And headers {Accept:'application/json' , Content-Type:'application/json'}
    When method post
    And status 201
    # PUT request
    Given path '/posts/1'
    And request
      """
      {
        "userId": 1,
        "id": 1,
        "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        "body": "one word"
    }
      """
    And headers {Accept: 'application/json' , Content-Type: 'application/json'}
    When method put
    Then status 200

    
  Scenario: To update the user Entry for existing user in JSON format by calling another feature file
    # <Gherkin keyword> <call> <read(<location of file>)>
    Given call read("../createUserEntry.feature")
    # PUT request
    Given path '/posts/1'
    And request
      """
      {
        "userId": 55,
        "id": 1,
        "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        "body": "one word"
    }
      """
    And headers {Accept: 'application/json' , Content-Type: 'application/json'}
    When method put
    Then status 200
    
    
  Scenario: To update the user Entry for existing uesr in JSON format by calling another feature file shared context
    # <Gherkin keyword> <call> <read(<location of file>)>
    # Given call read("../createUserEntry.feature")
    * def postRequest = call read("../createUserEntry.feature")
    And print "Calling Feature", postRequest.userId
    And print "Calling Feature", postRequest.getRandomValue()
    # PUT request
    Given path '/posts/1'
    And request
      """
      {
        "userId": '#(postRequest.userId)',
        "id": 1,
        "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        "body": "one word"
    }
      """
    And headers {Accept: 'application/json' , Content-Type: 'application/json'}
    When method put
    Then status 200
    * def responseBody = karate.jsonPath(response, "$[?(@.userId == " + postRequest.userId + " && @.id==1)].body")
    And match responseBody == ["one word"]
    
    
  Scenario: To update the user entry for existing user in JSON format by calling another feature file with variables
		# <Gherkin keyword> <call> <read(<location of file>)>
    # Given call read("../createUserEntry.feature") { var1:value , var2:value}
    * def getRandomValue = function(){return Math.floor((100) * Math.random());}
    * def userId = getRandomValue()
    * def postRequest = call read("../createUserEntryWithVariables.feature") {_url: 'https://jsonplaceholder.typicode.com' , _path: '/posts', _userId: '#(userId)'}
    # PUT request
    Given path '/posts/1'
    And request
      """
      {
        "userId": '#(userId)',
        "id": 1,
        "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        "body": "one word"
    }
      """
    And headers {Accept: 'application/json' , Content-Type: 'application/json'}
    When method put
    Then status 200
    * def responseBody = karate.jsonPath(response, "$[?(@.userId == " + userId + " && @.id==1)].body")
    And match responseBody == ["one word"]