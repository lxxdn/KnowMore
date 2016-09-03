$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "know_more/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "know_more"
  s.version     = KnowMore::VERSION
  s.authors     = ["julien"]
  s.email       = ["julien.luxiao@gmail.com"]
  # s.homepage    = "http://www.google.com"
  s.summary     = "This plugin aims to help you create questionnaires quickly!"
  # s.description = "TODO: Description of KnowMore."
  s.license     = "MIT"
  s.test_files = Dir["spec/**/*"]

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"

  s.add_development_dependency "sqlite3"

  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_girl_rails'
end
