lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'generate_ruby_tests/version'

Gem::Specification.new do |spec|
  spec.name          = 'rubygene'
  spec.version       = GenerateRubyTests::VERSION
  spec.authors       = ['brunobatista25']
  spec.email         = ['brunobatista101@gmail.com']
  spec.summary       = %q{Generates an Web,Api and Mobile Test Automation project with Cucumber,
    SitePrism, Capybara, Selenium, Httparty and JsonSchema.}
  spec.description   = %q{A simple gem to generate all files needed in a
    project Mobile, Web and Api.}
  spec.homepage      = 'https://github.com/brunobatista25/RubyGene'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.executables   = ['rubygene']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_runtime_dependency 'gherkin', '2.12.2'
  spec.add_runtime_dependency 'i18n', '>= 0.8.6'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_runtime_dependency 'thor', '~> 0.20.0'
end
