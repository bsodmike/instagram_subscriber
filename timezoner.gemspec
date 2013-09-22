# encoding: utf-8
$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "timezoner/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "timezoner"
  spec.version     = InstaSubscriber::VERSION
  spec.authors     = ["Michael de Silva"]
  spec.email       = ["michael@mwdesilva.com"]
  spec.homepage    = "http://mwdesilva.com"
  spec.summary     = "Easy Timezone handling in Rails."
  spec.description = spec.summary
  spec.license     = "MIT"

  spec.files = Dir["{lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 1.9.3'

  spec.add_dependency "rails", "~> 4.0.0"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec-rails", "~> 2.0"
  spec.add_development_dependency "mocha"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "yard"
end
