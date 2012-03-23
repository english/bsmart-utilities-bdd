module Bsmart
  VERSION = '0.1.0'

  require 'nokogiri'
  require 'roxml'
  require 'comma'

  require 'bsmart/tabbed_putter'
  require 'bsmart/cli/should_be_on_web'
  require 'bsmart/cli/bsmart_csv'
  require 'bsmart/cli/list_stock'
  require 'bsmart/cli/bsmart2magento'
  require 'bsmart/stock/product'
  require 'bsmart/stock/supplier'
  require 'bsmart/stock/catalog'
  require 'bsmart/stock/image_copier'
  require 'bsmart/ecom/attribute'
  require 'bsmart/ecom/product'
  require 'bsmart/ecom/catalog'
  require 'bsmart/csv/product'
end
