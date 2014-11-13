# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ServerPilot/version'

Gem::Specification.new do |spec|
  spec.name          = 'ServerPilot'
  spec.version       = ServerPilot::VERSION
  spec.authors       = ['Robert Coster']
  spec.email         = ['rob@signalfire.co.uk']
  spec.summary       ='ServerPilot'
  spec.description   = 'An API client gem to allow interaction from Ruby with the ServerPilot.io API'
  spec.homepage      = 'http://www.signalfire.co.uk'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.7'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.required_ruby_version = '~> 2.1'

end
