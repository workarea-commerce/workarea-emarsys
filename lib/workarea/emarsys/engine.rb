module Workarea
  module Emarsys
    class Engine < ::Rails::Engine
      include Workarea::Plugin
      isolate_namespace Workarea::Emarsys

      config.to_prepare do
        Storefront::ApplicationController.helper(Storefront::EmarsysAnalyticsHelper)
      end
    end
  end
end
