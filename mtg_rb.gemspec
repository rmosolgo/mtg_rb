# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mtg_rb/version'

Gem::Specification.new do |spec|
  spec.name          = "mtg_rb"
  spec.version       = MtgRb::VERSION
  spec.authors       = ["Robert Mosolgo"]
  spec.email         = ["rdmosolgo@gmail.com"]

  spec.summary       = %q{Parse MTGJSON and build a tree of Ruby objects}
  spec.homepage      = "https://github.com/rmosolgo/mtg_rb"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  # For unpacking image scans
  spec.add_runtime_dependency "rubyzip"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
