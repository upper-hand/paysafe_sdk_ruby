# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'paysafe/version'

Gem::Specification.new do |s|
  s.name     = 'paysafe'
  s.version  = Paysafe::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors  = ['Paysafe', 'Upper Hand']
  s.email    = ['contact@paysafe.com', 'engineering@upperhand.io']

  s.summary     = 'Paysafe API Ruby SDK'
  s.description = 'Paysafe API integration using Ruby'
  s.homepage    = 'http://www.paysafe.com/'
  s.license     = 'MIT'

  s.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  s.require_paths = ['lib']

  s.add_development_dependency 'bundler', '~> 2.0'
  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'pry-nav'
  s.add_development_dependency 'pry-remote'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'rspec', '~> 3.0'
  s.add_development_dependency 'rspec-nc'
  s.add_development_dependency 'rubocop', '0.75.0'
  s.add_development_dependency 'rubocop-performance'
end
