require 'spec_helper'

module Bsmart
  module Ecom
    describe Bsmart::Ecom::Catalog do
      it "reads its contents from an xml file" do
        lambda do
          Bsmart::Ecom::Catalog.from_xml(File.read('assets/ecom_catalog.xml'))
        end.should_not raise_error(NoMethodError)
      end
    end
  end
end
