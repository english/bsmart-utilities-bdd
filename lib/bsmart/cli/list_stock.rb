module Bsmart
  module CLI
    class ListStock
      def initialize(args, putter = $stdout)
        @args = args
        @putter = putter
      end

      def run
        @putter.puts catalog.to_s
      end

      def correct_arguments?
         valid_argument_length? or abort(usage)
      end

      def valid_argument_length?
        @args and (@args.size == 1 or @args.size == 3)
      end

      def catalog
        @catalog ||= get_catalog
      end

      def get_catalog
        if correct_arguments?
          if @args[1] == '-s'
            Stock::Catalog.from_xml(supplier_node)
          else
            Stock::Catalog.from_xml(File.read(@args.first))
          end
        end
      end

      def supplier_node
        doc = Nokogiri::XML(File.read(@args.first))
        doc.xpath("/catalog/supplier").each do |supplier|
          supplier.remove if supplier['name'][0..3] != @args[2]
        end
        doc
      end

      def usage
        <<USAGE
Usage: bsmart-list-stock <catalog>.xml [options]
  options:
    -s Only print a particular supplier
USAGE
      end
    end
  end
end
