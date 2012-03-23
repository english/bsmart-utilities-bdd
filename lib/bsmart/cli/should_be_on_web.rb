require 'ostruct'

module Bsmart::CLI
  class ShouldBeOnWeb
		IMAGE_ROOT = File.join *%w{ / Volumes bsmart Images }

    def initialize catalog_xml, web_csv, switch
			@catalog_xml = catalog_xml
			@web_csv = web_csv
      @ignore_images = switch == '--ignore-images'
    end

    def ignore_images?
      @ignore_images
    end

    def answer
      if candidates.empty?
        "Nothing!"
      else
        CSV.generate col_sep: "\t" do |csv|
          csv << ['sku', 'name']
          candidates.each do |product|
            csv << [product.sku, product.name]
          end
        end
      end
    end

		def candidates
      @candidates ||= in_stock_with_images.reject {|product|
        products_on_the_web.any? {|web| web.sku == product.sku }
      }
		end

		def products_on_the_web
			@products_on_the_web ||= get_products_on_web
		end

		def in_stock_with_images
      ignore_images? ? in_stock_products : in_stock_products.select {|product| product_has_image? product }
		end

		private

		def in_stock_products
			products = []
			doc = Nokogiri::XML @catalog_xml
			doc.css('product').each do |product|
				stock = product.at_css('CurrStk').content.strip.to_i
				name = product.at_css('Description').content.strip
				sku = product.at_css('StockNum').content.strip.gsub('-', '').to_i

				products << OpenStruct.new(name: name, sku: sku) if stock > 0
			end
			products
		end

		def product_has_image? product
			sku = product.sku.to_s
			dep = sku[0..1]
			sub_dep = sku[2..3]
			filename = [dep, sub_dep].join('-') + "-#{sku[4..6]}.jpg"
			File.exists? File.join IMAGE_ROOT, dep, sub_dep, filename
		end

		def get_products_on_web
			products = []
			CSV.parse @web_csv, headers: true, header_converters: :symbol do |row|
				products << OpenStruct.new(sku: row[:sku].to_i, name: row[:name])
			end
			products
		end
  end
end
