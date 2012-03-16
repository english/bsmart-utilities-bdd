require 'spec_helper'

module Bsmart
  module Ecom
    describe Catalog do
      it "reads its contents from an xml file" do
        lambda do
          Catalog.from_xml(File.read('assets/ecom_catalog.xml'))
        end.should_not raise_error(NoMethodError)
      end

      it "has products" do
        catalog = Catalog.from_xml(File.read('assets/ecom_catalog.xml'))

        catalog.products.should be_an(Array)

        catalog.products.all? do |product|
          product.class == Product
        end.should be_true

        catalog.products.count.should == 4
      end
    end
  end
end
