Feature: list stock information from a catalog

  In order to paint a picture of the stock we have
  As a command line user
  I want to run the bsmart-list-stock command
  So that I can see a range of information describing a catalog

  Scenario: show all stock info from catalog
    Given I have an XML file named "catalog.xml" with:
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
    Then the output should contain:
      """
Supplier:
code: 0001
name: ACCURIST WATCHES
Products:
  Product:
    Reference: GD1461
    StockNum: 35-25-041
    DiscReas:
    Description: Gts9Y Accurist/WhtRN/Blt
    Rsp: 1750.00
    Cnc: 497.50
    GM: 0065
    OrdQty: 000000
    Location: 000
    CurrStk: 0000000
    DepStk: 0000000
    Qtr1: 00000
    Qtr2: 00000
    SoldYTD: 000000
    SaleDate:
    InvDate:
      """
