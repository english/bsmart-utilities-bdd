require 'spec_helper'

module Bsmart
  describe Catalog do
    let(:output)  { double('output') }
    let(:catalog) { Catalog.from_xml(File.read('assets/tidy-sample.xml')) }

    it "uses the ROXML library" do
      lambda do
        Catalog.from_xml(File.read('assets/tidy-sample.xml'))
      end.should_not raise_error
    end

    it "holds an array of suppliers" do
      catalog.suppliers.should be_an(Array)

      catalog.suppliers.all? do |supplier|
        supplier.class == Bsmart::Supplier
      end.should be_true

      catalog.suppliers.count.should == 2
    end

    it "returns an array of all products in the catalog" do
      catalog.products.count.should == 6
      catalog.products.sample.should be_a(Product)
    end

    it "returns all duplicate products by supplier reference" do
      duplicates = catalog.duplicate_products

      duplicates.should be_an(Array)
      duplicates.count.should == 2
      duplicates.all? { |product| product.reference == 'ITE1005' }
    end

    it "counts products" do
      catalog.counted_products.should == {
        '3501000'   => 1,
        'A2-24126A' => 1,
        'ITE1001'   => 1,
        'ITE1003'   => 1,
        'ITE1005'   => 2
      }
    end

    it "finds duplicate references" do
      catalog.duplicate_references.should == ['ITE1005']
    end

    it "finds products by reference" do
      matches = catalog.find_by_reference('ITE1005')

      matches.count.should == 2
      matches.all? { |product| product.reference == 'ITE1005' }
    end

    it "can be printed" do
      $stdout.should_receive(:puts)
      puts catalog
    end

    it "is printed in a nicely formatted way" do
      msg = catalog.to_s
      msg.should =~ /2 suppliers and 6 products/
    end
  end
end
