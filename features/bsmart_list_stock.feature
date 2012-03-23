@ignore
Feature: bsmart-list-stock - list stock information from a catalog

  In order to paint a picture of the stock we have
  As a command line user
  I want to run the bsmart-list-stock command
  So that I can see a range of information describing a catalog

  Scenario: run bsmart-list-stock with no arguments
    When I run `bsmart-list-stock`
    Then the output should contain:
      """
      Usage: bsmart-list-stock <catalog>.xml [options]
        options:
          -s Only print a particular supplier
      """

  Scenario: show all stock info from catalog
    When I run `bsmart-list-stock ../../assets/small-catalog.xml`
    Then the output should contain "Code: 0001"
    And the output should match /Name: ACCURIST WATCHES/
    And the output should match /Product:/
    And the output should match /Reference:\s{2,}3501000/
    And the output should match /Stock Number:\s{2,}35-01-026/
    And the output should match /Description:\s{2,}Lds GP Rect MOP Set/
    And the output should match /Rsp:\s{2,}80\.0/

  Scenario: Run bsmart-list-stock with -s argument
    When I run `bsmart-list-stock ../../assets/small-catalog.xml -s 0630`
    Then the output should contain "Name: Nomination"
    And the output should contain "Stock Number:     81-01-"
    And the output should not contain "Stock Number: 77-01-"
