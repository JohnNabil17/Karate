Feature: To test the get end point of the application
	To test different get end point with different data format supported by the application
	
	Background:
		Given url 'https://dummy.restapiexample.com/api/v1'
	
	Scenario: To get the data in JSON format and validate from file
		Given path '/employees'
		And header Accept = 'application/json'
		When method get
		Then status 200
		#Create a variable to store the data from external file
		* def actualResponse = read("../JsonReader.json")
		And match response == actualResponse
		And print , actualResponse