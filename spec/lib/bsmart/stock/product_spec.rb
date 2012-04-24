require 'spec_helper'
require 'nokogiri'

require_relative '../../../../lib/bsmart/stock/product'

module Bsmart
  module Stock
    describe Product do
      subject {
        xml = Nokogiri::XML::Builder.new { |doc|
          doc.product {
            doc.Reference 'ITE1000'
            doc.StockNum '35-01-026'
            doc.Description 'Lds GP Rect MOP Set'
            doc.Rsp '80'
          }
        }.to_xml
        Product.from_xml xml
      }

      it "has a reference" do
        subject.reference.should == 'ITE1000'
      end

      it "has a stock number" do
        subject.stock_number.should == '35-01-026'
      end

      it "has a description" do
        subject.description.should == 'Lds GP Rect MOP Set'
      end

      describe :rsp do
        it "is a floating point number" do
          subject.rsp.should be_a(Float)
        end

        it "removes the leading 0s from the xml file" do
          subject.rsp.should == 80.00
        end
      end

      it "can be pretty printed" do
        message = subject.to_s
        message.should =~ /Stock Number:\s{2,}.35-01-026/
          message.should =~ /Reference:\s{2,}.ITE1000/
      end

      it "has a department" do
        subject.department.should == '35'
      end

      it "has a sub_department" do
        subject.sub_department.should == '01'
      end

      it "has an image filename" do
        subject.image.should == '35/01/35-01-026.jpg'
      end
    end
  end
end
