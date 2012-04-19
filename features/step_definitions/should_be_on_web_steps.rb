Before do
  @aruba_timeout_seconds = 10
end

Given /^a stock xml file named "([^"]*)" just with in stock items with images$/ do |filename|
	in_current_dir do
		FileUtils.cp '../../fixtures/in_stock_with_images.xml', filename
	end
end

Given /^a csv file named "([^"]*)" with skus for products on the web$/ do |filename|
	in_current_dir do
		FileUtils.cp '../../fixtures/on_web.csv', filename
	end
end

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
