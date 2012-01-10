module Bsmart
  class Product
    include ROXML

    xml_reader(:stock_number,     :from => 'StockNum')
    xml_reader(:margin,           :from => 'GM',       :as => Float)
    xml_reader(:deposit_quantity, :from => 'DepStk',   :as => Integer)
    xml_reader(:order_quantity,   :from => 'OrdQty',   :as => Integer)
    xml_reader(:location,         :from => 'Location')    { |loc| loc.to_i }
    xml_reader(:reference,        :from => 'Reference')   { |ref| ref.strip }
    xml_reader(:description,      :from => 'Description') { |desc| desc.strip }
    xml_reader(:rsp,              :from => 'Rsp')         { |rsp| sprintf("%.2f", rsp).to_f unless rsp.empty? }
    xml_reader(:cost,             :from => 'Cnc')         { |cost| sprintf("%.2f", cost).to_f unless cost.empty? }
    xml_reader(:stock_quantity,   :from => 'CurrStk')     { |qty| qty.strip.to_i  }
    xml_reader(:sold_this_year,   :from => 'SoldYTD')     { |qty| qty.strip.to_i }
  end
end
