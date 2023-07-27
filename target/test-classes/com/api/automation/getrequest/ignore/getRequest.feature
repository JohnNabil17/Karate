Feature: To test the get end point of the application
	To test different get end point with different data format supported by the application
	
	Background:
		Given url 'https://dummy.restapiexample.com/api/v1'
@ignore	
	Scenario: To get all the data from application in JSON format and validate its content
		Given path '/employees'
		And header Accept = 'application/json'
		When method get
		Then status 200
		And print response
		And match response.data.[0].id == 1
		And match response.data.[2].employee_salary == 86000