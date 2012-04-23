require 'aruba/cucumber'
require_relative 'file_generators'

Aruba.configure do |config|
  config.before_cmd do |cmd|
    set_env('JRUBY_OPTS', "-X-C --1.9") # disable JIT since these processes are so short lived
    set_env('JAVA_OPTS', "") # force jRuby to use client JVM for faster startup times
  end
end if RUBY_PLATFORM == 'java'


Before do @aruba_timeout_seconds = 10 end if RUBY_PLATFORM == 'java'

World FileGenerators
