require 'roxml'

require_relative 'product'

module Bsmart
  module Stock
    class Supplier
      include ROXML

      attr_reader :products

      xml_reader(:name, :from => '@name') {|name| name[7..-1].strip if name }
      xml_reader(:code, :from => '@name') {|name| name[0..3].strip if name }
      xml_reader :products, :as => [Product]

      def initialize products=nil
        @products = Array(products)
      end

      def to_s
        output = ""
        output << "Supplier:\n"
        output << "  Code: #{code}\n"
        output << "  Name: #{name}\n"
        products.each {|p| output << p.to_s }

        output
      end
    end
  end
end
