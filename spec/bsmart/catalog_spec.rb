require 'spec_helper'

module Bsmart
  describe Catalog do
    it "uses the ROXML library" do
      lambda do
        Catalog.from_xml(File.read('assets/tidy.xml'))
      end.should_not raise_error
    end

    it "holds an array of suppliers" do
      catalog = Catalog.from_xml(File.read('assets/tidy.xml'))

      catalog.supplier.should be_an_instance_of(Array)
      catalog.supplier.all? { |item| item.should_be_an_instance_of(Supplier) }
    end
  end
end
