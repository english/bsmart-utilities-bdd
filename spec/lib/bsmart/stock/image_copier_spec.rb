require 'spec_helper'

module Bsmart::Stock
  describe ImageCopier do
    subject do
      products = [
        Product.new('77-01-001', '001-001-12'),
        Product.new('77-01-002', '002-001-12')
      ]
      catalog = Catalog.new Supplier.new products
      ImageCopier.new catalog
    end

		describe :find_image do
			context "image filename exactly matching reference" do
				it "finds the image for a product" do
					images = [ '001-001-12.jpg' ]
					product = Product.new '77-01-001', '001-001-12'
					image = subject.find_image images, product
					image.should == '001-001-12.jpg'
				end
			end

			context "begining of image filename matches reference" do
				it "finds the image for a product" do
					images = [ '001-001-12_blabla.jpg' ]
					product = Product.new '77-01-001', '001-001-12'
					image = subject.find_image images, product
					image.should == '001-001-12_blabla.jpg'
				end
			end
		end

    it "creates the required directories for an image" do
      FileUtils.should_receive(:mkdir_p).with 'dest/01/01'
      subject.make_way_for 'dest/01/01/01-01-001.jpg'
    end

    it "copies images" do
      images = [ '001-001-12.jpg' ]
      dest   = 'dest'

      FileUtils.should_receive(:copy).with '001-001-12.jpg', 'dest/77/01/77-01-001.jpg'

      subject.copy_images images, dest
    end
  end
end
