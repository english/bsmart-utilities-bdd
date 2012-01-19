require 'spec_helper'

module Bsmart
  module CLI
    describe ListStock do
      it "prints the catalog" do
        args = ['assets/small-catalog.xml']
        stock_lister = ListStock.new(args)
        catalog = stock_lister.catalog

        catalog.should_receive(:to_s)

        stock_lister.run
      end

      it "checks the arguments supplied and prints usage info if uncorrect arguments" do
        args = nil
        lambda { ListStock.new(args).run }.should raise_error(SystemExit, <<"USAGE")
Usage: bsmart-list-stock <catalog>.xml [options]
  options:
    -s Only print a particular supplier
USAGE
      end

      it "prints a specific supplier if specified" do
        args = ['assets/small-catalog.xml', '-s', '0001']
        output = double('output').as_null_object
        stock_lister = ListStock.new(args, output)
        catalog = stock_lister.catalog

        catalog.suppliers.first.should_receive(:to_s)
        catalog.suppliers.size.should == 1

        stock_lister.run
      end
    end
  end
end
