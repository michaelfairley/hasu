# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hasu/version'

Gem::Specification.new do |spec|
  spec.name          = "hasu"
  spec.version       = Hasu::VERSION
  spec.authors       = ["Michael Fairley"]
  spec.email         = ["michaelfairley@gmail.com"]
  spec.description   = %q{Prototype Gosu games with ease}
  spec.summary       = %q{Prototype Gosu games with ease}
  spec.homepage      = "https://github.com/michaelfairley/hasu"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  %w[gosu listen].each {|dep| spec.add_dependency dep }

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
