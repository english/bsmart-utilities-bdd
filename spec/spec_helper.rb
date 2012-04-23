require_relative '../features/support/file_generators'

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
    products = [
      {
        'Reference'   => '0008-051-14', 'StockNum' => '77-01-003',
        'Description' => 'Heart white', 'Rsp'      => '000000042.95',
        'CurrStk'     => '0000000'
      },
      {
        'Reference'   => '0009-001-12', 'StockNum' => '77-01-225',
        'Description' => 'Padlock',     'Rsp'      => '000000029.95',
        'CurrStk'     => '0000001'
      },
      {
        'Reference'   => '0010-051-14', 'StockNum' => '77-01-004',
        'Description' => 'Key',         'Rsp'      => '000000048.95',
        'CurrStk'     => '0000003'
      }
    ]
    FileGenerators.bsmart_catalog_xml products
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
    csv = <<CSV
sku,_store,name,_type,_category,_product_websites,brand
7701225,,Thomas Sabo Cupid Charm,simple,Brands/Thomas Sabo,base,Thomas Sabo
7701002,,Thomas Sabo Eternity Charm,simple,Brands/Thomas Sabo,base,Thomas Sabo
7701004,,Thomas Sabo White Heart,simple,Brands/Thomas Sabo,base,Thomas Sabo
7701003,,Thomas Sabo White Heart,simple,Brands/Thomas Sabo,base,Thomas Sabo
CSV
    csv.strip
  end
end
