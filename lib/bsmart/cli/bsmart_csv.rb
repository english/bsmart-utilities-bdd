require 'bsmart'

module Bsmart::CLI
	class BsmartCSV
		def initialize input, output
      @input = input
		end

		def run
      
		end

    def products
      xml = Nokogiri::XML @input
      products = xml.css('product').map do |product_xml|
        Bsmart::CSV::Product.from_xml product_xml
      end
    end
	end
end
