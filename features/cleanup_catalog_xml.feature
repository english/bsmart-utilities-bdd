Feature: transform bsmart's catalog

  In order to work with bsmart's catalog easier in other applications
  As a geek
  I want to transform bsmart's catalog into a sensible xml file

  Scenario: Run bsmart-transform-xml with a bsmart catalog xml
    Given a catalog from bsmart's Stock and Sales by Suppl.Ref. - SRI called "input.xml"
    And the stock.xsl stylesheet
    When I run `bsmart-transform-xml input.xml stock.xsl`
    Then the output should match the expected XML
