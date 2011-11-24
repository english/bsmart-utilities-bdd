Then /^the file "([^"]*)" should match$/ do |file, expected_string|
  check_file_contents(file, /#{expected_string}/, false)
end
