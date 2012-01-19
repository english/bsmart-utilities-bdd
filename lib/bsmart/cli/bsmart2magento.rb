module Bsmart
  module CLI
    class Bsmart2magento
      attr_accessor :catalog

      def initialize
        @catalog = Bsmart::Ecom::Catalog.new
      end

      def run
      end
    end
  end
end
