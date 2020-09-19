# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rupology/version'

Gem::Specification.new do |spec|
  spec.name          = 'rupology'
  spec.version       = Rupology::VERSION
  spec.authors       = ['Daisuke Fujimura (fd0)']
  spec.email         = ['booleanlabel@gmail.com']

  spec.summary       = 'Repology API v1 client library.'
  spec.description   = 'Repology API v1 client library.'
  spec.homepage      = 'https://github.com/fd00/rupology'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'faraday', '>= 0.15.4'

  spec.add_development_dependency 'bundler', '>= 1.16'
  spec.add_development_dependency 'rake', '>= 10.0'
  spec.add_development_dependency 'rspec', '>= 3.8.0'
  spec.add_development_dependency 'rubocop', '>= 0.61.1'
end
