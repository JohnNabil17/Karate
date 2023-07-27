Feature: Variables creation in Karate Framework

Background: Create and Initialize Variables
	* def app_name = "Google"
	* def page_load_timeout = 20

#<Gherkin Keyword> <def> <Variable_name> = <value>

	Scenario: To create a Variable
	# Use Variable for repeating value
	# Storing the data from an external file
	# In the matcher expresions
	# Passing the Data from one feature file to another
	
	Given def int = 10
	And def string = "John"
	Then print "int var = ", int
	And print "string var = ", string
	* def newValue = int + 5
	And print "New value = ", newValue
	And print "Backgroud variables==> " , app_name , page_load_timeout