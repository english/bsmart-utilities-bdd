require 'fileutils'

require_relative 'catalog'

module Bsmart::Stock
	class ImageCopier
		def initialize catalog
      @catalog = catalog
		end

    def copy_images images, dest_prefix
      @catalog.products.each do |product|
        puts "checking for #{product.stock_number}"
        src = find_image images, product
        if src
          dest = File.join dest_prefix, product.image
          puts 'src: ' + src
          puts 'dest: ' + dest
          make_way_for dest
          FileUtils.copy src, dest
        end
      end
    end

    def find_image images, product
      images.find {|image| File.basename(image, '.jpg') =~ /^#{product.reference}/ }
    end

    def make_way_for filename
      FileUtils.mkdir_p File.dirname filename
    end
	end
end
