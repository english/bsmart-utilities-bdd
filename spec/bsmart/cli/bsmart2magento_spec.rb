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

      it "outputs a csv file"

      it "takes an input catalog argument"

      it "takes an output csv argument"

      it "can be run as a daemon"
    end
  end
end
