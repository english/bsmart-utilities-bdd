require 'spec_helper'

require_relative '../../../../lib/bsmart/stock/catalog'
require_relative '../../../../lib/bsmart/stock/supplier'
require_relative '../../../../lib/bsmart/stock/product'

module Bsmart
  module Stock
    describe Supplier do
      subject {
        xml = Nokogiri::XML::Builder.new { |doc|
          doc.supplier(:name => "0001 - ACCURIST WATCHES") {
            doc.product {
            doc.Reference 'ITE1000'
            doc.StockNum '35-01-026'
            doc.Description 'Lds GP Rect MOP Set'
            doc.Rsp '80'
          }
        }
      }.to_xml

      Supplier.from_xml xml
      }

      it "has a name" do
        subject.name.should == 'ACCURIST WATCHES'
      end

      it "has a code" do
        subject.code.should == '0001'
      end

      it "has an array of products" do
        subject.products.count.should == 1
      end
    end
  end
end
