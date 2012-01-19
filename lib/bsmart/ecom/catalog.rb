module Bsmart
  module Ecom
    class Catalog
      include ROXML

      xml_accessor :products, :from => "ITEM", :as => [Product]
    end
  end
end
