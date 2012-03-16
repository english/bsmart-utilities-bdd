Given /^a stock xml named "([^"]*)" file just with in stock items with images$/ do |filename|
	in_current_dir do
		FileUtils.cp '../../fixtures/in_stock_with_images.xml', filename
	end
end

Given /^a csv file named "([^"]*)" with skus for products on the web$/ do |filename|
	in_current_dir do
		FileUtils.cp '../../fixtures/on_web.csv', filename
	end
end

Then /^I should see the skus for each product in the stock xml$/ do
  pending # express the regexp above with the code you wish you had
end
