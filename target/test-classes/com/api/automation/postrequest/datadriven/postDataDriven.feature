Feature: To create job description in the test application

  Scenario Outline: To create product description in the test application <method>
    Given print '<url>'
    When print '<path>'
    Then print '<method>'
    And print '<status>'

    Examples: 
      | url                   | path          | method | status |
      | https://dummyjson.com | /products     | get    |    200 |
      | https://dummyjson.com | /products/add | post   |    200 |
      | https://dummyjson.com | /products/add | put    |    201 |

  Scenario Outline: Data Driven for the product description entry - <id>
    Given url 'https://dummyjson.com'
    And path '/products/add'
    And request {"id": '#(id)',"title": '#(title)',"description": '#(description)',"price": 10,"discountPercentage": 10.00,"rating": 10.00,"stock": 10,"stocks": 20,"brand": "Bad brand","category": "Bad category","thumbnail": "https://i.dummyjson.com/data/products/1/thumbnail.jpg","images": ["https://i.dummyjson.com/data/products/1/1.jpg","https://i.dummyjson.com/data/products/1/2.jpg","https://i.dummyjson.com/data/products/1/3.jpg","https://i.dummyjson.com/data/products/1/4.jpg","https://i.dummyjson.com/data/products/1/thumbnail.jpg"]}
    And headers {Accept: 'application/json' , Content-Type: 'application/json'}
    When method post
    And status <status>

    Examples: 
      | id    | title     | description | status |
      |   101 | Bad Title | Bad des     |    200 |
      | id    | Bad Title | Bad des     |    200 |
      | false | Bad Title | Bad des     |    200 |
