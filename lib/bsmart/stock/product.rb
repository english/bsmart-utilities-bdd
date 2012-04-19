module Bsmart
  module Stock
    class Product
      include ROXML

			attr_accessor :stock_number, :reference, :stock_quantity

      xml_reader(:stock_number,     :from => 'StockNum')
      xml_reader(:margin,           :from => 'GM',       :as => Float)
      xml_reader(:deposit_quantity, :from => 'DepStk',   :as => Integer)
      xml_reader(:order_quantity,   :from => 'OrdQty',   :as => Integer)
      xml_reader(:location,         :from => 'Location')    { |loc| loc.to_i if loc }
      xml_reader(:reference,        :from => 'Reference')   { |ref| ref.strip  if ref}
      xml_reader(:description,      :from => 'Description') { |desc| desc.strip  if desc}
      xml_reader(:rsp,              :from => 'Rsp')         { |rsp| sprintf("%.2f", rsp).to_f unless rsp.nil? or rsp.empty? }
      xml_reader(:cost,             :from => 'Cnc')         { |cost| sprintf("%.2f", cost).to_f unless cost.nil? or cost.empty? }
      xml_reader(:stock_quantity,   :from => 'CurrStk')     { |qty| qty.strip.to_i if qty }
      xml_reader(:sold_this_year,   :from => 'SoldYTD')     { |qty| qty.strip.to_i if qty }

			def initialize sku=nil, reference=nil, qty=nil
				@stock_number   = sku
				@reference      = reference
        @stock_quantity = qty
			end

      def to_s
        "  Product:\n" +
        "    Reference:        #{reference}\n" +
        "    Stock Number:     #{stock_number}\n" +
        "    Description:      #{description}\n" +
        "    Rsp:              #{rsp}\n" +
        "    Cost:             #{cost}\n" +
        "    Margin:           #{margin}\n" +
        "    Order Quantity:   #{order_quantity}\n" +
        "    Stock Quantity:   #{stock_quantity}\n" +
        "    Deposit Quantity: #{deposit_quantity}\n" +
        "    Sold This Year:   #{sold_this_year}\n"
      end

			def department
				stock_number[0..1]
			end

			def sub_department
				stock_number[3..4]
			end

			def image
				"#{department}/#{sub_department}/#{stock_number}.jpg"
			end

      def in_stock?
        stock_quantity > 0
      end

      def on_web? web_skus
        web_skus.include? stock_number.gsub('-', '')
      end

      def image_exists? image_dir
        File.exists? File.join image_dir, image
      end
    end
  end
end
