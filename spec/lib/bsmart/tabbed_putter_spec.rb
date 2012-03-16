require 'spec_helper'

module Bsmart
  describe TabbedPutter do
    let(:output) { double('output').as_null_object }
    let(:putter) { TabbedPutter.new(output) }

    describe :tab! do
      it "increases the indent for subsequent messages" do
        putter.tab!
        putter.tab_counter.should == 1
      end
    end

    describe :un_tab! do
      it "decreases the indent for subsequent messages" do
        putter.tab!
        putter.un_tab!

        putter.tab_counter.should == 0
      end
    end

    describe :puts do
      context "with tab_size = 2 and num_tabs = 1" do
        it "prints the supplied message with two preceeding spaces" do
          putter.tab!

          output.should_receive(:puts).with('  print me with a tab')

          putter.puts("print me with a tab")
        end
      end

      context "with tab_size = 4 and num_tabs = 2" do
        it "prints the supplied message with eight preceeding spaces" do
          putter = TabbedPutter.new(output, 4)
          2.times { putter.tab! }

          output.should_receive(:puts).with('        print me with two tabs')

          putter.puts("print me with two tabs")
        end
      end
    end
  end
end
