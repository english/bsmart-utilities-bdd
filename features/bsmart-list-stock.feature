#Feature: list stock information from a catalog

  #In order to paint a picture of the stock we have
  #As curious person
  #I want to run the bsmart-list-stock command with or without arguments
  #So that I can see a range of information describing stock

  #Scenario: show all stock info from catalog
    #Given I have an XML file named "catalog.xml" with:
      #"""
      #"""
    #When I run `bsmart-list-stock catalog.xml`
    #Then The output should contain:
      #"""
      #0101001 
      #"""
