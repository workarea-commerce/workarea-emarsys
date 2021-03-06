$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "workarea/emarsys/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "workarea-emarsys"
  s.version     = Workarea::Emarsys::VERSION
  s.authors     = ["Jeff Yucis"]
  s.email       = ["jyucis@weblinc.com"]
  s.homepage    = "https://github.com/workarea-commerce/workarea-emarsys"
  s.summary     = "Emarsys email service provider"
  s.description = "Workarea Integration with Emarsys"

  s.files = `git ls-files`.split("\n")

  s.license = 'Business Software License'

  s.add_dependency 'workarea', '>=  3.5.x'
  s.add_dependency 'workarea-google_product_feed', '~> 3.x'
  s.add_dependency "faraday", "~> 0.10"
end
