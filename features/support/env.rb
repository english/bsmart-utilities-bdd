require 'aruba/cucumber'
require_relative 'file_generators'

if RUBY_PLATFORM == 'java'
  Before do @aruba_timeout_seconds = 10 end
end

World FileGenerators
