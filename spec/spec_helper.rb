require 'bsmart'

module Helpers
  def self.input_xml
    File.read File.expand_path '../../fixtures/sabo_catalog.xml', __FILE__
  end

  def self.single_product_xml
    File.read File.expand_path '../../fixtures/sabo_product.xml', __FILE__
  end
end
