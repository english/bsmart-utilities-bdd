require 'active_support/core_ext/hash'

Given /^a catalog from bsmart's Stock and Sales by Suppl\.Ref\. \- SRI called "([^"]*)"$/ do |filename|
	in_current_dir do
		FileUtils.cp '../../fixtures/DB1SC583.xml', filename
	end
end

Given /^the stock\.xsl stylesheet$/ do
	in_current_dir do
		FileUtils.cp '../../fixtures/stock.xsl', 'stock.xsl'
	end
end

Then /^the output should match the expected XML$/ do
	in_current_dir do
    expected = Hash.from_xml File.read '../../fixtures/DB1SC583_output.xml'
    Hash.from_xml(all_output).should == expected
  end
end
