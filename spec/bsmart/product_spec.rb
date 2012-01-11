require 'spec_helper'

module Bsmart
  describe Product do
    let(:catalog)  { Catalog.from_xml(File.read('assets/tidy-sample.xml')) }
    let(:accurist) { catalog.suppliers[0].products.first }
    let(:ted)      { catalog.suppliers[1].products.first }

    it "has a reference" do
      accurist.reference.should == '3501000'
      ted.reference.should      == 'ITE1001'
    end

    it "has a stock number" do
      accurist.stock_number.should == '35-01-026'
      ted.stock_number.should      == '35-18-116'
    end

    it "has a description" do
      accurist.description.should == 'Lds GP Rect MOP Set'
      ted.description.should      == 'Lds SS Brn/BluShape/d Str'
    end

    describe :rsp do
      it "is a floating point number" do
        accurist.rsp.should be_a(Float)
        ted.rsp.should      be_a(Float)
      end

      it "removes the leading 0s from the xml file" do
        accurist.rsp.should == 80.00
        ted.rsp.should      == 95.00
      end
    end

    describe :cost do
      it "is a floating point number" do
        accurist.cost.should be_a(Float)
        ted.cost.should      be_a(Float)
      end

      it "removes the leading 0s from the xml file" do
        accurist.cost.should == 39.95
        ted.cost.should      == 47.50
      end
    end

    it "has a gross margin" do
      accurist.margin.should == 40
      ted.margin.should      == 40
    end

    it "has an order quantity" do
      accurist.order_quantity.should == 0
      ted.order_quantity.should      == 1
    end

    it "belongs to a location" do
      accurist.location.should == 0
      ted.location.should      == 2
    end

    it "has a stock quantity" do
      accurist.stock_quantity.should == 0
      ted.stock_quantity.should      == 3
    end

    it "has quantity of stock on deposit" do
      accurist.deposit_quantity.should == 0
      ted.deposit_quantity.should      == 1
    end

    it "has the quantity sold for the year to date" do
      accurist.sold_this_year.should == 0
      ted.sold_this_year.should      == 2
    end

    it "can be pretty printed" do
      message = accurist.to_s
      message.should =~ /Stock Number:\s{2,}.35-01-026/
      message.should =~ /Reference:\s{2,}.3501000/
    end
  end
end
