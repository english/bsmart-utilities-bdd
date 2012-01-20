module Bsmart
  module Ecom
    class Product
      include ROXML

      CATEGORIES = {
        1 => "Rings",
        2 => "Charms",
        4 => "Neckwear",
        5 => "Wristwear",
        6 => "Earrings",
        8 => "Other",
        9 => "Watches"
      }

      xml_accessor :status, :from => "ATTR" do |attr|
        case attr
        when "A" then "Add"
        when "M" then "Modify"
        when "D" then "Delete"
        end
      end

      xml_accessor :stock_number, :from => "STKNO"
      xml_accessor(:department, :from => "MENU") {|sub| "%02d" % sub }
      xml_accessor(:sub_department, :from => "SUBMENU") {|sub| "%02d" % sub }
      xml_accessor :supplier_reference, :from => "SUPPLREF"
      xml_accessor :supplier_shortname, :from => "SUPPLSHORT"
      xml_accessor :quantity, :from => "QTY", :as => Integer
      xml_accessor :price, :from => "PRICE", :as => Float
      xml_accessor(:discontinued?, :from => "REASON") {|r| r == "D" }
      xml_accessor :name, :from => "WEBDESC"
      xml_accessor(:description, :from => "NOTEPAD") {|d| d.strip }
      xml_accessor(:category, :from => "CATEGORY", :as => Integer) {|code| CATEGORIES[code] }
      xml_accessor :attributes, :from => "ATTRIBUTE", :as => [Attribute]

      def categories
        @categories ||= self.brand \
          ? [self.category, "Brands/#{self.brand}"] \
          : [self.category]
      end

      def stone
        first = find_attribute_value_by_name('Stone')
        if first.nil?
          return []
        end

        second = self.second_stone
        if second.nil?
          return [first]
        else
          return [first, second]
        end
      end

      private

      def find_attribute_value_by_name(name)
        attr = attributes.find { |element| element.name == name }
        return attr.value if attr
      end

      def method_missing(method, *args, &block)
        attributes.each do |attr|
          if method == attr.name.gsub(' ', '_').gsub('2nd', 'second').downcase.to_sym
            return attr.value unless attr.value.empty?
          end
        end

        super(method, *args, &block)
      end
    end
  end
end
