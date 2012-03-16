require 'spec_helper'

module Bsmart::CLI
  describe ShouldBeOnWeb do
    it "takes two args" do
      expect {
        ShouldBeOnWeb.new('', '')
      }.should_not raise_error ArgumentError
    end

    describe :run do
      it "returns an array of skus" do
        xml = Helpers.in_stock_with_images_xml
        csv = Helpers.on_web_csv
        subject = ShouldBeOnWeb.new xml, csv
        subject.answer.should == "Nothing!"
      end
    end
  end
end
