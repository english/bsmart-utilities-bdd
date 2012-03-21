require 'nokogiri'

module Bsmart
  class MRITransformer
    attr_reader :output

    def initialize input, style
      @input = input
      @style = style
    end

    def transform
      xml = Nokogiri::XML utf8
      xslt = Nokogiri::XSLT File.read @style
      @output = xslt.transform xml
    end

    private

    def utf8
      File.read(@input).encode "UTF-8", "us-ascii", invalid: :replace, undef: :replace
    end
  end
end
