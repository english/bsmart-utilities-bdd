require 'spec_helper'

module Bsmart
  module CLI
    describe Bsmart2magento do
      it "instantiates a catalog" do
        pending do
          cli = Bsmart2magento.new
          cli.run
          cli.catalog.products.should_not be_nil
        end
      end

      context "when supplied a catalog argument" do
        it "reads the catalog form the path provided" do
          cli = Bsmart2magento.new('-c assets/ecom_catalog_other.xml')
          cli.run
          cli.catalog.products.first.name.should == "Hugo Boss Watch" # or something
        end
      end

      context "when not supplied a catalog argument" do
        it "reads the catalog from the default path" do
          cli = Bsmart2magento.new
          cli.run
          cli.catalog.products.first.name.should == "Carnival Rose Quartz & Garnet Necklace"
        end
      end

      context "when supplied a csv argument" do
        it "outputs a csv file to the location provided" do
          cli = Bsmart2magento.new('-c assets/update_other.csv')
          cli.run
          File.exists?('assets/update_other.csv').should be_true
        end
      end

      context "when not supplied a csv argument" do
        it "outputs a csv file to the default path" do
          cli = Bsmart2magento.new
          cli.run
          File.exists?('assets/update.csv').should be_true
        end
      end

      context "when passed the -d arguement" do
        it "runs as a daemon" do
          cli = Bsmart2magento.new('-d')
          cli.run

          FileUtils.cp('assets/ecom_catalog.xml', 'catalog.xml')
          sleep(30.seconds)

          File.exists?('update.csv1').should be_true
        end
      end
    end
  end
end
