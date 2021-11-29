$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "action_encrypt/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "action_encrypt"
  spec.version     = ActionEncrypt::VERSION
  spec.authors     = ["David Van Der Beek"]
  spec.email       = ["earlynovrock@gmail.com"]
  spec.summary     = "Easily add encrypted fields to your models."
  spec.homepage    = "https://github.com/dvanderbeek/action_encrypt"
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 5.2"
  spec.add_dependency "attr_encrypted"
  spec.add_dependency "blind_index"

  spec.add_development_dependency "pg"
end
