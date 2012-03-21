require 'spec_helper'

module Bsmart::CLI
  describe ShouldBeOnWeb do
    it "takes two args" do
      expect {
        ShouldBeOnWeb.new('', '')
      }.should_not raise_error ArgumentError
    end

    describe :run do
      context "when all stock in xml is on web" do
        it "returns an array of skus" do
          xml = Helpers.in_stock_with_images_xml
          csv = Helpers.on_web_csv
          subject = ShouldBeOnWeb.new xml, csv
          subject.answer.should == "Nothing!"
        end
      end

      context "when all stock in xml is in stock and not on web" do
        it "returns tab delimeted data" do
          xml = Helpers.in_stock_with_images_xml_not_on_web
          csv = Helpers.on_web_csv
          subject = ShouldBeOnWeb.new xml, csv

          subject.answer.should match /.*\t.*/
        end
      end
    end

    describe :products_on_web do
      it "returns the products on the web" do
        xml = Helpers.in_stock_with_images_xml_not_on_web
        csv = Helpers.on_web_csv
        subject = ShouldBeOnWeb.new xml, csv

        products = subject.products_on_the_web
        products[0].sku.should == 7701225
        products[1].sku.should == 7701002
        products[2].sku.should == 7701004

        products[0].name.should == "Thomas Sabo Cupid Charm"
        products[1].name.should == "Thomas Sabo Eternity Charm"
        products[2].name.should == "Thomas Sabo White Heart"
      end
    end

    it "gets the products that have images" do
      xml = Helpers.in_stock_with_images_xml_not_on_web
      csv = Helpers.on_web_csv
      subject = ShouldBeOnWeb.new xml, csv

      File.should_receive(:exists?).with('/Volumes/bsmart/Images/77/01/77-01-618.jpg').and_return true
      File.should_receive(:exists?).with('/Volumes/bsmart/Images/77/01/77-01-619.jpg').and_return true
      File.should_receive(:exists?).with('/Volumes/bsmart/Images/77/01/77-01-620.jpg').and_return false

      products = subject.in_stock_with_images
      products[0].sku.should == 7701618
      products[1].sku.should == 7701619
      products.size.should == 2
    end

    it "get the candidates for stock to add to web" do
      xml = Helpers.in_stock_with_images_xml_not_on_web
      csv = Helpers.on_web_csv
      subject = ShouldBeOnWeb.new xml, csv

      File.stub :exists? do |arg| arg != '/Volumes/bsmart/Images/77/01/77-01-620.jpg' end
      subject.candidates.should =~ [
        OpenStruct.new(sku: 7701618, name: "Heart white"),
        OpenStruct.new(sku: 7701619, name: "Padlock")
      ]
    end
  end
end
