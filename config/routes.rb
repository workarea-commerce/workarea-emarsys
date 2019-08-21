Workarea::Admin::Engine.routes.draw do
  scope '(:locale)', constraints: Workarea::I18n.routes_constraint do
    namespace :emarsys do
      resource :configuration, only: [:edit, :update]
    end
  end
end
