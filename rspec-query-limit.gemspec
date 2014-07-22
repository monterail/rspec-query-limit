# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/query_limit/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec-query-limit"
  spec.version       = Rspec::QueryLimit::VERSION
  spec.authors       = ["Jakub Cieslar"]
  spec.email         = ["cieslar.jakub@gmail.com"]
  spec.summary       = %q{Rspec custom matchers for Rails query counter}
  spec.description   = %q{Rspec custom matchers for Rails query counter}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'rspec-rails'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
