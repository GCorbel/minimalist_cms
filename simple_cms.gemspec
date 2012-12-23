$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "simple_cms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "simple_cms"
  s.version     = SimpleCms::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of SimpleCms."
  s.description = "TODO: Description of SimpleCms."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.9"
  s.add_dependency "globalize3", "0.2.0"
  s.add_dependency "friendly_id", "4.0.8"
  s.add_dependency "inherited_resources", "1.3.1"
  s.add_dependency "backbone-on-rails", "0.9.2.1"
  s.add_dependency "jquery-ui-rails", "2.0.2"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
end
