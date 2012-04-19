module Bsmart
  module Stock
    class Catalog
      include ROXML

			attr_accessor :suppliers

      xml_accessor :suppliers, :as => [Supplier]

			def initialize suppliers=nil
				@suppliers = Array(suppliers)
			end

      def products
        suppliers.inject([]) do |products, supplier|
          products += supplier.products
        end
      end

      def web_candidates web_skus
        products.select { |product|
          product.in_stock? and !web_skus.include? product.stock_number.gsub('-', '')
        }
      end

      def find_by_reference(reference)
        products.select {|product| product.reference == reference }
      end

      def duplicate_products
        duplicate_references.inject([]) {|dupes, ref| dupes += find_by_reference(ref) }
      end

      def duplicate_references
        counted_products.select {|product, count| count > 1 }.keys
      end

      def counted_products
        products.inject(Hash.new(0)) { |hsh, prod| hsh[prod.reference] += 1; hsh }
      end

      def to_s
        output = ""
        suppliers.each do |supplier|
          output << "#{supplier}\n"
        end
        output << "This catalog has #{suppliers.count} suppliers and #{products.count} products."
      end
    end
  end
end
