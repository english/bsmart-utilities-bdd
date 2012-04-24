require 'nokogiri'

require_relative '../csv/product'

module Bsmart::CLI
  class BsmartCSV
    def initialize input, output
      @input = input
      @output = output
    end

    def run
      io << products.to_comma
    end

    def io
      @io ||= File.new @output, 'wb'
    end

    def products
      xml = Nokogiri::XML @input
      products = xml.css('product').map do |product_xml|
        Bsmart::CSV::Product.from_xml product_xml
      end
    end
  end
end
