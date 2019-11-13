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
      Workarea.config.customer_id
    end

    def self.merchant_id
      Workarea.config.merchant_id
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
        Emarsys::Gateway.new(secret_key, Emarsys.customer_id, { test: !Workarea.config.emarsys_production_api })
      else
        Emarsys::BogusGateway.new
      end
    end

    def self.sales_data_gateway
      if credentials.present?
        Emarsys::SalesDataGateway.new(api_token, { merchant_id: Emarsys.merchant_id })
      else
        Emarsys::SalesDataBogusGateway.new
      end
    end
  end
end
