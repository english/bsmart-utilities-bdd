Feature: Generate csv file from bsmart stock xml

  So that I can compare what we have in stock with other csv files
  I should be able to generate a csv file from bsmart stock

  Scenario: Small Sabo catalog
    Given a small thomas sabo stock file called "catalog.xml"
    When I run `bsmart-csv catalog.xml output.csv`
    Then the file named "output.csv" should have the following data:
      | sku       | reference   | name        | qty | 
      | 77-01-003 | 0008-051-14 | Heart white | 0   | 
      | 77-01-225 | 0009-001-12 | Padlock     | 1   | 
      | 77-01-004 | 0010-051-14 | Key         | 3   | 
