require 'spec_helper'

module Bsmart::CLI
	describe BsmartCSV do
    let(:input) { Helpers.input_xml }

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
			it "runs" do
				expect {
					Bsmart::CLI::BsmartCSV.new(nil, nil).run
				}.should_not raise_error NoMethodError
			end
		end
	end
end
