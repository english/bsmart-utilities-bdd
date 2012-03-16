require 'bsmart'

module Helpers
  def self.input_xml
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
end
