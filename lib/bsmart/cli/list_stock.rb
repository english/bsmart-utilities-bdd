module Bsmart
  module CLI
    class ListStock
      def run(args)
        if args.size == 0
          puts "Usage: bsmart-list-stock catalog.xml [options]"
          exit 0
        end

        putter  = Bsmart::TabbedPutter.new(STDOUT)
        catalog = Nokogiri::XML(File.read(args.shift))

        if args.shift == '-s'
          xpath = "/catalog/supplier[substring(@name, 1, 4)='#{args.shift}']"
        else
          xpath = "/catalog/supplier"
        end

        catalog.xpath(xpath).each do |supplier|
          putter.puts 'Supplier:'
          putter.tab!

          putter.puts("Code: #{supplier['name'][0..3]}")
          putter.puts("Name: #{supplier['name'][7..supplier['name'].length].strip}")
          putter.puts("Products:")

          supplier.xpath("product[Reference != '']").each do |product|
            putter.tab!
            putter.puts("Product:")
            putter.tab!

            product.children.each do |attribute|
              unless attribute.name == "text"
                if attribute.name == "Rsp"
                  val = "%0.2f" % attribute.text.to_f
                else
                  val = attribute.text
                end
                putter.puts("#{attribute.name}: #{val}")
              end
            end

            putter.un_tab!
            putter.un_tab!
          end

          putter.un_tab!
        end
      end
    end
  end
end
