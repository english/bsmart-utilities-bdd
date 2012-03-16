Feature: Generate csv file from bsmart stock xml

  So that I can compare what we have in stock with other csv files
  I should be able to generate a csv file from bsmart stock

  Scenario: Small Sabo catalog
    Given a small thomas sabo stock file called "catalog.xml"
    When I run `bsmart-csv catalog.xml output.csv`
    Then the file named "output.csv" should have the following data:
      | sku | name | qty | discontinued |
