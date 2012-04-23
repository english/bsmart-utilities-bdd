require 'aruba/cucumber'
require_relative 'file_generators'

ENV['PATH'] = "#{File.expand_path(File.dirname(__FILE__) + '/../../bin')}#{File::PATH_SEPARATOR}#{ENV['PATH']}"

if RUBY_PLATFORM == 'java'
  Before do @aruba_timeout_seconds = 10 end
end

World FileGenerators
