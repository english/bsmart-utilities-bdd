Feature: Show stock that should be on the web

  Scenario: All stock already on web
    Given a stock xml file named "catalog.xml" just with in stock items with images
    And a csv file named "web.csv" with skus for products on the web
    When I run `should-be-on-web catalog.xml web.csv`
    Then the output should contain exactly "Nothing!\n"

  Scenario: No stock on web
    Given an xml file named "catalog.xml" with Sabo stock that have images but aren't on web
    And a csv file named "web.csv" with skus for products on the web
    When I run `should-be-on-web catalog.xml web.csv`
    Then the output should match the following:
      | sku     | name        | 
      | 7701618 | Heart white | 
      | 7701619 | Padlock     | 
      | 7701620 | Key         | 

  Scenario: Give me all stock that isn't on web
    Given an xml file named "catalog.xml"the following products:
      | StockNum | Reference | Description | CurrStk | 
      | 7701001  | ref1      | Product 1   | 1       | 
      | 7701002  | ref2      | Product 2   | 2       | 
      | 7701003  | ref3      | Product 3   | 0       | 
    And a csv file named "web.csv" with the following products:
      | sku     | name      | 
      | 7701001 | Product 1 | 
    When I run `should-be-on-web catalog.xml web.csv --ignore-images`
    Then the output should match the following:
      | sku     | ref  | name      |
      | 7701002 | ref2 | Product 2 |
