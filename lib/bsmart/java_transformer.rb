require 'java'

$CLASSPATH << File.expand_path('../../../../lib/java/xalan.jar', __FILE__)

%w{ StringBufferInputStream FileNotFoundException ByteArrayOutputStream IOException }.each do |name|
  java_import "java.io.#{name}"
end

%w{ Transformer TransformerConfigurationException TransformerException
    TransformerFactory stream.StreamResult stream.StreamSource }.each do |name|
  java_import "javax.xml.transform.#{name}"
end

module Bsmart
  class JavaTransformer
    attr_reader :output

    def initialize xml, style
      @xml    = xml
      @style  = style
      @output = ByteArrayOutputStream.new
    end

    def transform
      transformer.transform stream_source, stream_result
    end

    private

    def transformer
      TransformerFactory.new_instance.new_transformer StreamSource.new @style
    end

    def stream_source
      StreamSource.new StringBufferInputStream.new @xml
    end

    def stream_result
      StreamResult.new @output
    end
  end
end
