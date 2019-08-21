require 'workarea'
require 'workarea/storefront'
require 'workarea/admin'
require 'workarea/google_product_feed'

require 'workarea/emarsys/engine'
require 'workarea/emarsys/version'

require 'escher'

module Workarea
  module Emarsys
    def self.credentials
      (Rails.application.secrets.emarsys || {}).deep_symbolize_keys
    end

    def self.sales_data_credentials
      (Rails.application.secrets.emarsys_sales || {}).deep_symbolize_keys
    end

    def self.secret_key
      credentials[:secret_key]
    end

    def self.api_token
      sales_data_credentials[:api_token]
    end

    def self.customer_id
      credentials[:customer_id]
    end

    def self.config
      Workarea.config.emarsys
    end

    # Conditionally use the real gateway when secrets are present.
    # Otherwise, use the bogus gateway.
    #
    # @return [Emarsys::Gateway]
    def self.gateway
      if credentials.present?
        settings = Workarea::Emarsys::Configuration.current
        Emarsys::Gateway.new(secret_key, settings.customer_id, { test: !settings.production? })
      else
        Emarsys::BogusGateway.new
      end
    end

    def self.sales_data_gateway
      if credentials.present?
        settings = Workarea::Emarsys::Configuration.current
        Emarsys::SalesDataGateway.new(api_token, { merchant_id: settings.merchant_id })
      else
        Emarsys::SalesDataBogusGateway.new
      end
    end
  end
end
