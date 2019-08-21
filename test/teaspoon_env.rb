require 'workarea/testing/teaspoon'

Teaspoon.configure do |config|
  config.root = Workarea::Emarsys::Engine.root
  Workarea::Teaspoon.apply(config)
end
