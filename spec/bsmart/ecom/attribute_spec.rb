require 'spec_helper'

module Bsmart
  module Ecom
    describe Attribute do
      let(:catalog)   { Bsmart::Ecom::Catalog.from_xml(File.read('assets/ecom_catalog.xml')) }
      let(:attribute) { catalog.products.first.attributes.first }

      it "has a name" do
        attribute.name.should == "Stone"
      end

      it "has a value" do
        attribute.value.should == "Quartz"
      end
    end
  end
end
