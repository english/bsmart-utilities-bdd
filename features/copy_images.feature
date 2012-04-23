Feature: Copy images to bsmart directory that aren't already there

  Scenario: App runs
    When I run `jruby ../../bin/bsmart-copy-images --help`
    Then the output should contain "bsmart-copy-images <xml> <image_src> <image_dest>"

  Scenario: bsmart-copy-images <xml> <image_src> <image_dest>
    Given an xml file named "catalog.xml" with the following products:
      | StockNum   | Reference |
      | 77-01-001  | ref1      |
      | 77-01-002  | ref2      |
      | 77-01-003  | ref3      |
    And the following images
      | image    |
      | ref1.jpg |
      | ref2.jpg |
    And a directory named "output"
    When I run `bsmart-copy-images catalog.xml . output`
    Then the following files should exist:
      | output/77/01/77-01-001.jpg | 
      | output/77/01/77-01-002.jpg | 

  Scenario: images that have different file endings
    Given an xml file named "catalog.xml" with the following products:
      | StockNum   | Reference |
      | 77-01-001  | ref1      |
      | 77-01-002  | ref2      |
      | 77-01-003  | ref3      |
    And the following images
      | image        | 
      | ref1.jpg     | 
      | ref2.jpg     | 
      | ref3_bla.jpg | 
    When I run `bsmart-copy-images catalog.xml . output`
    Then the following files should exist:
      | output/77/01/77-01-001.jpg | 
      | output/77/01/77-01-002.jpg | 
      | output/77/01/77-01-003.jpg | 
