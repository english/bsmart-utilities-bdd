require 'spec_helper'

require_relative '../../../../lib/bsmart/csv/product'

module Bsmart
  module CSV
    describe Product do
      subject { Product.from_xml Helpers.single_product_xml }

      its(:name) { should == 'Heart white' }
      its(:sku)  { should == '77-01-003' }
      its(:qty)  { should == '0' }
      its(:reference) { should == '0008-051-14' }

      describe :to_comma do
        it "should include each attribute" do
          subject.to_comma.should =~ ['Heart white', '77-01-003', '0', '0008-051-14']
        end
      end
    end
  end
end
