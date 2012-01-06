module Bsmart
  class Catalog
    include ROXML

    xml_reader :supplier, :as => Supplier
  end
end
