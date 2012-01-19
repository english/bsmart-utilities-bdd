require 'spec_helper'

module Bsmart
  module Ecom
    describe Product do
      let(:catalog) { Catalog.from_xml(File.read('assets/ecom_catalog.xml')) }
      let(:garnet_necklace)      { catalog.products[0] }
      let(:onyx_necklace)        { catalog.products[1] }
      let(:rose_quartz_necklace) { catalog.products[2] }

      describe :status do
        it "can be 'Add'" do
          garnet_necklace.status.should == "Add"
        end

        it ", 'Modify" do
          onyx_necklace.status.should == "Modify"
        end

        it "or 'Delete" do
          rose_quartz_necklace.status.should == "Delete"
        end
      end

      it "has a stock number" do
        garnet_necklace.stock_number.should == "5502016"
      end

      it "has a department" do
        garnet_necklace.department.should == "55"
      end

      it "has a subdepartment" do
        garnet_necklace.sub_department.should == "02"
      end
    end
  end
end
