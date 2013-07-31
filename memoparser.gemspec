# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'version'
require 'memoparser.rb'

Gem::Specification.new do |spec|
  spec.name          = "memoparser"
  spec.version       = MemoParser::VERSION
  spec.authors       = ["Noam Gagliardi"]
  spec.email         = [""]
  spec.description   = %q{A text parser for MemoRabble}
  spec.summary       = %q{MemoParser takes in plain text and outputs a hash 
                          of attributes.}
  spec.homepage      = "http://CLUSTERfoo.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
