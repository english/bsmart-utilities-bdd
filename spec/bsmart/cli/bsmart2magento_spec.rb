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
        it "reads the catalog form the path provided"
      end

      context "when not supplied a catalog argument" do
        it "reads the catalog from the default path"
      end

      context "when supplied a csv argument" do
        it "outputs a csv file to the location provided"
      end

      context "when not supplied a csv argument" do
        it "outputs a csv file to the default path"
      end

      context "when passed the -d arguement" do
        it "runs as a daemon"
      end
    end
  end
end
