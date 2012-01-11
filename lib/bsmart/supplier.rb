module Bsmart
  class Supplier
    include ROXML

    xml_reader(:name, :from => '@name') {|name| name[7..-1].strip }
    xml_reader(:code, :from => '@name') {|name| name[0..3].strip }
    xml_reader :products, :as => [Product]

    def to_s
      output = ""
      output << "Supplier:\n"
      output << "  Code: #{code}\n"
      output << "  Name: #{name}\n"
      products.each {|p| output << p.to_s }

      output
    end
  end
end
