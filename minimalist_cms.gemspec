$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "minimalist_cms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "minimalist_cms"
  s.version     = MinimalistCms::VERSION
  s.authors     = ["gcorbel"]
  s.email       = ["guirec.corbel@gmail.com"]
  s.homepage    = "https://github.com/GCorbel/minimalist_cms"
  s.summary     = "This is the simpler cms ever"
  s.description = "This is the simpler cms ever"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.11"
  s.add_dependency "frontendeditor_ckeditor"
  s.add_dependency "acts_as_page"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "shoulda"
end
