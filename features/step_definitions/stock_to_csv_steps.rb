require 'csv'

Then /^the file named "([^"]*)" should have the following data:$/ do |filename, table|
  in_current_dir do
    actual = CSV.parse File.read filename
    table.diff! actual
  end
end
