#!/usr/bin/env rake

require "bundler/gem_tasks"
require 'benchmark'

task :get_catalog do
  require 'iconv'
  require 'nokogiri'

  bsmart_catalog = '/Volumes/bsmart/data/DB1SC583.xml'
  utf8 = Iconv.conv("utf8//ignore//translit", "us-ascii", File.read(bsmart_catalog))

  xml = Nokogiri::XML(utf8)
  xslt = Nokogiri::XSLT(File.read('assets/stock.xsl'))
  catalog = xslt.transform(xml)

  File.open('assets/catalog.xml', 'w') { |f| f.write catalog }
end

task :get_catalog_java do
  require 'iconv'

  time = Benchmark.realtime do
    require 'java'
    $CLASSPATH << File.expand_path('../../lib/java/xalan.jar', __FILE__)

    %w{ StringBufferInputStream FileNotFoundException FileOutputStream IOException }.each do |name|
      java_import "java.io.#{name}"
    end

    %w{ Transformer TransformerConfigurationException TransformerException
    TransformerFactory stream.StreamResult stream.StreamSource }.each do |name|
      java_import "javax.xml.transform.#{name}"
    end

    bsmart_catalog = '/Volumes/bsmart/data/DB1SC583.xml'
    utf8 = Iconv.conv("utf8//ignore//translit", "us-ascii", File.read(bsmart_catalog))

    transformer_factory = TransformerFactory.new_instance
    transformer = transformer_factory.new_transformer(StreamSource.new('assets/stock.xsl'))
    transformer.transform(StreamSource.new(StringBufferInputStream.new(utf8)),
      StreamResult.new(FileOutputStream.new('assets/catalog.xml')))
  end

  puts time
end

task :expand do
  `git ls-files`.split.each do |file|
    spaced = `expand #{file}`
    File.open(file, 'w') { |f| f.write(spaced) }
  end
end
