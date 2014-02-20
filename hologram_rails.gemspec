# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hologram_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "hologram_rails"
  spec.version       = HologramRails::VERSION
  spec.authors       = ["Jenny Chou"]
  spec.email         = ["pair+jchou@pivotallabs.com"]
  spec.summary = %q{Hologram with Rails.}
  spec.description = %q{Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  spec.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "genspec"
end
