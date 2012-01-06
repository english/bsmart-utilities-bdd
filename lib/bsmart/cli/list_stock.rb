module Bsmart
  module CLI
    class ListStock
      def initialize
        @putter = Bsmart::TabbedPutter.new(STDOUT)
      end

      def run(args)
        if args.size == 0
          puts "Usage: bsmart-list-stock catalog.xml [options]"
          exit 0
        end

        supplier = (args[1] == '-s' ? args[2] : nil)

        print_catalog(Nokogiri::XML(File.read(args[0])), supplier)
      end

      def print_catalog(catalog, supplier)
        if supplier
          xpath = "/catalog/supplier[substring(@name, 1, 4)='#{supplier}']"
        else
          xpath = "/catalog/supplier"
        end

        catalog.xpath(xpath).each do |supplier|
          print_supplier supplier
        end
      end

      def print_supplier(supplier)
          @putter.puts 'Supplier:'
          @putter.tab!

          @putter.puts("Code: #{supplier['name'][0..3]}")
          @putter.puts("Name: #{supplier['name'][7..supplier['name'].length].strip}")
          @putter.puts("Products:")

          supplier.xpath("product[Reference != '']").each do |product|
            print_product product
          end

          @putter.un_tab!
      end

      def print_product(product)
        @putter.tab!
        @putter.puts("Product:")
        @putter.tab!

        print_attributes(product)

        @putter.un_tab!
        @putter.un_tab!
      end

      def print_attributes(product)
        product.children.each do |attribute|
          unless attribute.name == "text"
            if attribute.name == "Rsp"
              val = "%0.2f" % attribute.text.to_f
            else
              val = attribute.text
            end
            @putter.puts("#{attribute.name}: #{val}")
          end
        end
      end
    end
  end
end
