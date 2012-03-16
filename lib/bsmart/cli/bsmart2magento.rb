module Bsmart
  module CLI
    class Bsmart2magento
      attr_accessor :catalog

      def initialize
        @catalog = Bsmart::Ecom::Catalog.from_xml(File.read('assets/ecom_catalog.xml'))
      end

      def run
      end
    end
  end
end
