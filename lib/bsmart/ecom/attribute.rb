module Bsmart
  module Ecom
    class Attribute
      include ROXML

      xml_accessor :name, :from =>"ATT-DESC"
      xml_accessor :value, :from =>"ATT-VALUE"
    end
  end
end
