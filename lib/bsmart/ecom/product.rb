module Bsmart
  module Ecom
    class Product
      include ROXML

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
    end
  end
end
