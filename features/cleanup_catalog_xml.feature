Feature: transform bsmart's catalog

  In order to work with bsmart's catalog easier in other applications
  As a geek
  I want to transform bsmart's catalog into a sensible xml file

  Scenario: Run bsmart-transform-xml with a bsmart catalog xml
    Given a file named "DB1SC583.xml" with:
      """
<?xml version="1.0" encoding="UTF-8"?>                      
<?xml-stylesheet type="text/xsl" href="Db1sc583.xsl"?>      
<StockSalesRpt>                                             
    <StockSalesHdr>                                         
        <RunDate>Inv Date  </RunDate>                       
        <Month>OCTOBER   2011        </Month>               
        <Desc>ALL SUPPLIERS       </Desc>                   
        <Type>BOTH TYPES     </Type>                        
        <Disc>ALL ITEMS           </Disc>                   
        <Disc2>                                </Disc2>     
        <Qtr1>QTR2</Qtr1>                                   
        <Qtr2>QTR5</Qtr2>                                   
        <Period>Q1-4 </Period>                              
        <Spare1>Spare 1 </Spare1>                           
        <Spare2>Spare 2 </Spare2>                           
        <Spare3>Spare 3 </Spare3>                           
        <Spare4>Spare 4 </Spare4>                           
        <Spare5>Spare 5 </Spare5>                           
    </StockSalesHdr>                                        
    <StockSalesRec Type="SH">                               
        <Reference>0001 - ACCURIST WATCHES </Reference>     
        <StockNum>         </StockNum>                      
        <DiscReas>  </DiscReas>                             
        <Description>                         </Description>
        <Rsp>            </Rsp>                             
        <Cnc>            </Cnc>                             
        <GM>       </GM>                                    
        <OrdQty>      </OrdQty>                             
        <Location>    </Location>                           
        <CurrStk>        </CurrStk>                         
        <DepStk>        </DepStk>                           
        <Qtr1>      </Qtr1>                                 
        <Qtr2>      </Qtr2>                                 
        <SoldYTD>       </SoldYTD>                          
        <SaleDate>        </SaleDate>                       
        <InvDate>        </InvDate>                         
    </StockSalesRec>                                        
    <StockSalesRec Type="  ">                               
        <Reference>GD1461                  </Reference>     
        <StockNum>35-25-041</StockNum>                      
        <DiscReas>  </DiscReas>                             
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
        <SaleDate>        </SaleDate>                       
        <InvDate>        </InvDate>                         
    </StockSalesRec>                                        
    <StockSalesRec Type="  ">                               
        <Reference>                        </Reference>     
        <StockNum>         </StockNum>                      
        <DiscReas>  </DiscReas>                             
        <Description>                         </Description>
        <Rsp>            </Rsp>                             
        <Cnc>            </Cnc>                             
        <GM>       </GM>                                    
        <OrdQty>      </OrdQty>                             
        <Location>001 </Location>                           
        <CurrStk> 0000001</CurrStk>                         
        <DepStk> 0000000</DepStk>                           
        <Qtr1> 00000</Qtr1>                                 
        <Qtr2> 00000</Qtr2>                                 
        <SoldYTD> 000000</SoldYTD>                          
        <SaleDate>        </SaleDate>                       
        <InvDate> 0807   </InvDate>                         
    </StockSalesRec>                                        
</StockSalesRpt>                                             
      """
    When I run `bsmart-transform-xml ../../assets/DB1SC583.xml catalog.xml`
    Then the exit status should be 0
    And a file named "catalog.xml" should exist
    And the file "catalog.xml" should match
      """
<?xml version="1.0" encoding="iso-8859-1"?>
<?xml-stylesheet type="text/xsl" href="Db1sc583.xsl"?><catalog>
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
    And the contents of "catalog.xml" should be UTF-8
