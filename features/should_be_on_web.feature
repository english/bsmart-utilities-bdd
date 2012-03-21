@wip
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
