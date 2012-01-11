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
    Given a sample catalog
    When I run `bsmart-list-stock catalog.xml`
    Then the output should contain "  Code: 0001"
    And the output should contain "  Name: ACCURIST WATCHES"
    And the output should contain "    Product:"
    And the output should contain "      Reference: GD1461"
    And the output should contain "      Stock Number: 35-25-041"
    And the output should contain "      Description: Gts9Y Accurist/WhtRN/Blt"
    And the output should contain "      Rsp: 1750.00"

  Scenario: Run bsmart-list-stock with -s argument
    Given a sample catalog
    When I run `bsmart-list-stock catalog.xml -s 0630`
    Then the output should contain "Name: Nomination"
    And the output should contain "Stock Number: 81-01-"
    And the output should not contain "Stock Number: 77-01-"
