require 'spec_helper'
require 'csv'

require_relative '../../../../lib/bsmart/cli/bsmart_csv'

module Bsmart::CLI
  describe BsmartCSV do
    let(:input) { Helpers.sabo_catalog }

    it "takes xml input and csv output files as args" do
      expect {
        BsmartCSV.new 'input', 'output'
      }.should_not raise_error ArgumentError
    end

    it "creates products from the xml input" do
      subject = BsmartCSV.new input, 'output.csv'

      subject.products.size.should == 3
    end

    describe :run do
      it "responds to run" do
        expect {
          Bsmart::CLI::BsmartCSV.new(nil, nil).run
        }.should_not raise_error NoMethodError
      end

      it "outputs a csv representation to the output file" do
        subject = BsmartCSV.new input, 'output.csv'
        class << subject
          def io
            @io ||= StringIO.new
          end
        end
        subject.run

        expected = CSV.parse Helpers.expected_csv
        actual = CSV.parse subject.io.string

        actual.should =~ expected
      end
    end
  end
end
