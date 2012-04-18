require 'nokogiri'

module Bsmart
  class MRITransformer
    attr_reader :output

    def initialize xml, style
      @xml   = xml
      @style = style
    end

    def transform
      doc = Nokogiri::XML @xml
      xslt = Nokogiri::XSLT File.read @style
      @output = xslt.transform doc
    end
  end
end
