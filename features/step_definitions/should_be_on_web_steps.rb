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
  builder = Nokogiri::XML::Builder.new do |xml|
    xml.catalog {
      xml.supplier {
        products_table.hashes.each do |product|
          xml.product {
            product.each {|key, value| xml.send key.to_sym, value }
          }
        end
      }
    }
  end
  in_current_dir do
    File.open(filename, 'wb') {|file| file.write builder.to_xml }
  end
end

Given /^a csv file named "([^"]*)" with the following products:$/ do |filename, products_table|
  in_current_dir do
    CSV.open filename, 'wb' do |csv|
      csv << ['sku', 'name']
      products_table.hashes.each do |product|
        csv << [ product[:sku], product[:name] ]
      end
    end
  end
end
