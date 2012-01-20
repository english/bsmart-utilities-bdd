require 'spec_helper'

module Bsmart
  module Ecom
    describe Product do
      let(:catalog) { Catalog.from_xml(File.read('assets/ecom_catalog.xml')) }

      let(:garnet_necklace)      { catalog.products[0] }
      let(:onyx_necklace)        { catalog.products[1] }
      let(:rose_quartz_necklace) { catalog.products[2] }
      let(:ring)                 { catalog.products[3] }

      describe :status do
        it "can be 'Add'" do
          garnet_necklace.status.should == "Add"
        end

        it "Modify" do
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

      it "has a supplier_reference" do
        rose_quartz_necklace.supplier_reference.should == "5502049"
      end

      it "has a supplier_shortname" do
        garnet_necklace.supplier_shortname.should == "G JENSEN"
      end

      describe :quantity do
        it "is an integer" do
          garnet_necklace.quantity.should be_an_integer
        end

        it "can be positive" do
          garnet_necklace.quantity.should == 1
        end

        it "can be negative" do
          onyx_necklace.quantity.should == -1
        end
      end

      it "has a price" do
        garnet_necklace.price.should == 235
      end

      it "can be discontinued" do
        garnet_necklace.should be_discontinued
        rose_quartz_necklace.should_not be_discontinued
      end

      it "name" do
        garnet_necklace.name.should == "Carnival Rose Quartz & Garnet Necklace"
      end

      it "has a description" do
        garnet_necklace.description.should == "Georg Jensen 18inch silver curb chain with double curved garnet and rose quartz stone set silver drops."
      end

      it "belongs to categories" do
        garnet_necklace.categories.should include("Neckwear")
        garnet_necklace.categories.should include("Brands/Georg Jensen")
      end

      describe "additional attributes" do
        context "when the attribute is set" do
          it "returns the value" do
            garnet_necklace.brand.should == "Georg Jensen"
            garnet_necklace.jensen_collection.should == "Carnival"
            ring.material.should == "Platinum"
          end

          it "forms an array of values when multiple are set. E.g. Stone and 2nd Stone" do
            garnet_necklace.stone.should include("Quartz")
            garnet_necklace.stone.should include("Garnet")
          end

          context "when the attribute is not set" do
            it "raises #{:NoMethodError} when asked for the attribute" do
              lambda { onyx_necklace.brand }.should raise_error(NoMethodError)
              lambda { garnet_necklace.neckwear_type }.should raise_error(NoMethodError)
            end
          end
        end
      end
    end
  end
end
