# @<user-define-keyword>
@Confidence
Feature: To create the user entry in the test application
	Helper for POST /posts
	
	Scenario: To create the user entry with JSON data
	Given url _url
	And path _path
	And print "Helper ==>", _url
	And print "Helper ==>", _path
	And print "Helper ==>", _userId
    And request {"userId": '#(_userId)',"id": 102,"title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit","body": "Fifty"}
    And headers {Accept:'application/json' , Content-Type:'application/json'}
    When method post
    And status 201

