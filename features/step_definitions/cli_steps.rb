@announce
Given /^a full catalog\.xml$/ do
  @aruba_timeout_seconds = 20
  in_current_dir do
    FileUtils.cp '../../assets/tidy.xml', 'full-catalog.xml'
  end
end

Then /^the file "([^"]*)" should match$/ do |file, expected_string|
  check_file_content(file, /#{expected_string}/, false)
end
