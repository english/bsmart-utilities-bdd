require 'spec_helper'

module Bsmart
  describe Supplier do
    let(:catalog) { Catalog.from_xml(File.read('assets/small-catalog.xml')) }

    it "has a name" do
      accurist = catalog.suppliers.first
      accurist.name.should == 'ACCURIST WATCHES'
    end

    it "has a code" do
      ted_baker = catalog.suppliers[1]
      ted_baker.code.should == '0057'
    end

    it "has an array of products" do
      accurist = catalog.suppliers.first

      accurist.products.all? do |product|
        product.class == Bsmart::Product
      end.should be_true
      accurist.products.count.should == 2
    end
  end
end
