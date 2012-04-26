# -*- encoding: utf-8 -*-
require File.expand_path('../lib/bsmart/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Jamie English"]
  gem.email         = ["jamienglish@gmail.com"]
  gem.description   = %q{Utilities to help working with bsmart.}
  gem.summary       = <<SUMMARY
A set of command line tools to automate tasks for Bransom's inventory
management and CRM system 'bsmart'. Copy images named by supplier reference,
transform an SRI catalog into a workable XML file. Find out which products
have images and are in stock but aren't on the web. Transform an SRI catalog
into a csv file with minimum headers.
SUMMARY
  gem.homepage      = "http://github.com/jamienglish/bsmart-utilities-bdd"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = %w(bsmart-copy-images bsmart-csv bsmart-transform-xml should-be-on-web)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "bsmart-utilities"
  gem.require_paths = ["lib"]
  gem.version       = Bsmart::VERSION

  gem.add_dependency("roxml", "~> 3.3.1")
  gem.add_dependency("comma", "~> 3.0.3")
  gem.add_dependency("methadone", "~> 1.0.0")

  gem.add_development_dependency("rake")
  gem.add_development_dependency("cucumber", "~> 1.1.9")
  gem.add_development_dependency("rspec", "~> 2.8.0")
  gem.add_development_dependency("aruba", "~> 0.4.11")
  gem.add_development_dependency("guard-rspec", "~> 0.6.0")
  gem.add_development_dependency("guard-cucumber", "~> 0.7.5")
  gem.add_development_dependency("ruby_gntp", "~> 0.3.4")
  gem.add_development_dependency("simplecov", "~> 0.6.2")
end
