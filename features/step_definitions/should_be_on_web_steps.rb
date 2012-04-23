Then /^the output should match the following:$/ do |table|
  table.diff! CSV.parse all_output, col_sep: "\t"
end

Given /^an xml file named "([^"]*)" with the following products:$/ do |filename, products_table|
  write_bsmart_catalog_xml filename, products_table.hashes
end

Given /^a csv file named "([^"]*)" with the following products:$/ do |filename, products_table|
  write_bsmart_csv filename, products_table.hashes
end
