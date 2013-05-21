$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "s3streamer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "s3streamer"
  s.version     = S3streamer::VERSION
  s.authors     = ["Valentin Ballestrino"]
  s.email       = ["vala@glyph.fr"]
  s.homepage    = "http://www.glyph.fr"
  s.summary     = "Simple S3 File streaming to client"
  s.description = "Simple S3 File streaming to client"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 3.2.13"
  s.add_dependency "aws-sdk", '~> 1.10'

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec-rails"
end
