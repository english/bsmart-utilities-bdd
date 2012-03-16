require 'csv'

Given /^a small thomas sabo stock file called "([^"]*)"$/ do |filename|
	in_current_dir do
		FileUtils.cp '../../fixtures/sabo_catalog.xml', filename
	end
end

Then /^the file named "([^"]*)" should have the following data:$/ do |filename, table|
  in_current_dir do
    actual = CSV.parse File.read filename
    table.diff! actual
  end
end
