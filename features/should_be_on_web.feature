@wip
Feature: Show stock that should be on the web

  Scenario: All stock already on web
    Given a stock xml named "catalog.xml" file just with in stock items with images
    And a csv file named "on_web.csv" with skus for products on the web
    When I run `should-be-on-web catalog.xml web.csv`
    Then the output should contain exactly "Nothing!\n"
