require 'simplecov'
SimpleCov.start

def setup_temp_dir
	FileUtils.mkdir_p 'tmp/rspec'
end

def teardown_temp_dir
	FileUtils.rm_rf 'tmp'
end

def in_temp_dir &block
	Dir.chdir 'tmp/rspec' do
		yield
	end
end

module Helpers
  def self.sabo_catalog
    File.read File.expand_path '../../fixtures/sabo_catalog.xml', __FILE__
  end

  def self.single_product_xml
    File.read File.expand_path '../../fixtures/sabo_product.xml', __FILE__
  end

  def self.expected_csv
    csv = <<CSV
sku,reference,name,qty
77-01-003,0008-051-14,Heart white,0
77-01-225,0009-001-12,Padlock,1
77-01-004,0010-051-14,Key,3
CSV
    csv.strip
  end

  def self.in_stock_with_images_xml
    File.read File.expand_path '../../fixtures/in_stock_with_images.xml', __FILE__
  end

	def self.in_stock_with_images_xml_not_on_web
    File.read File.expand_path '../../fixtures/in_stock_with_images_not_on_web.xml', __FILE__
	end

  def self.on_web_csv
    File.read File.expand_path '../../fixtures/on_web.csv', __FILE__
  end
end
