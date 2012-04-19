Given /^an xml file named "([^"]*)" with Sabo stock that have images but aren't on web$/ do |filename|
	in_current_dir do
		FileUtils.cp '../../fixtures/in_stock_with_images_not_on_web.xml', filename
	end
end

Then /^the output should match the following:$/ do |table|
  table.diff! CSV.parse all_output, col_sep: "\t"
end

Given /^an xml file named "([^"]*)" with the following products:$/ do |filename, products_table|
  write_bsmart_catalog_xml filename, products_table.hashes
end

Given /^a csv file named "([^"]*)" with the following products:$/ do |filename, products_table|
  write_bsmart_csv filename, products_table.hashes
end
