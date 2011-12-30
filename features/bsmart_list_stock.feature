Feature: bsmart-list-stock - list stock information from a catalog

  In order to paint a picture of the stock we have
  As a command line user
  I want to run the bsmart-list-stock command
  So that I can see a range of information describing a catalog

  Scenario: run bsmart-list-stock with no arguments
    When I run `bsmart-list-stock`
    Then the output should contain:
      """
      Usage: bsmart-list-stock catalog.xml [options]
      """

  Scenario: show all stock info from catalog
    Given a file named "catalog.xml" with:
      """
<catalog>
  <supplier name="0001 - ACCURIST WATCHES ">
    <product>
      <Reference>GD1461                  </Reference>
      <StockNum>35-25-041</StockNum>
      <DiscReas/>
      <Description>Gts9Y Accurist/WhtRN/Blt </Description>
      <Rsp>000001750.00</Rsp>
      <Cnc>000000497.50</Cnc>
      <GM>   0065</GM>
      <OrdQty>000000</OrdQty>
      <Location>000 </Location>
      <CurrStk> 0000000</CurrStk>
      <DepStk> 0000000</DepStk>
      <Qtr1> 00000</Qtr1>
      <Qtr2> 00000</Qtr2>
      <SoldYTD> 000000</SoldYTD>
      <SaleDate/>
      <InvDate/>
    </product>
    <product>
      <Reference/>
      <StockNum/>
      <DiscReas/>
      <Description/>
      <Rsp/>
      <Cnc/>
      <GM/>
      <OrdQty/>
      <Location>001 </Location>
      <CurrStk> 0000001</CurrStk>
      <DepStk> 0000000</DepStk>
      <Qtr1> 00000</Qtr1>
      <Qtr2> 00000</Qtr2>
      <SoldYTD> 000000</SoldYTD>
      <SaleDate/>
      <InvDate> 0807   </InvDate>
    </product>
</supplier>
</catalog>
      """
    When I run `bsmart-list-stock catalog.xml`
    Then the output should contain "  Code: 0001"
    And the output should contain "  Name: ACCURIST WATCHES"
    And the output should contain "    Product:"
    And the output should contain "      Reference: GD1461"
    And the output should contain "      StockNum: 35-25-041"
    And the output should contain "      Description: Gts9Y Accurist/WhtRN/Blt"
    And the output should contain "      Rsp: 1750.00"

  Scenario: Run bsmart-list-stock with -s argument
    Given a full catalog.xml
    When I run `bsmart-list-stock full-catalog.xml -s 0630`
    Then the output should contain "Name: Nomination"
    And the output should contain "StockNum: 81-01-"
    And the output should not contain "StockNum: 77-01-"
