Given /^the following images$/ do |images_table|
	touch_files images_table.hashes.map { |hash| hash['image'] }
end
