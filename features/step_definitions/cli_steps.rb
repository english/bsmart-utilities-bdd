Given /^a full catalog\.xml$/ do
  @aruba_timeout_seconds = 5
  in_current_dir do
    FileUtils.cp '../../assets/tidy.xml', 'full-catalog.xml'
  end
end

Then /^the file "([^"]*)" should match$/ do |file, expected_string|
  check_file_content(file, /#{expected_string}/, false)
end

Then /^the contents of "([^"]*)" should be UTF-8$/ do |file|
  in_current_dir do
    File.read(file).encoding.name.should == "UTF-8"
  end
end
