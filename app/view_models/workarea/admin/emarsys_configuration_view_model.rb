module Workarea
  module Admin
    class EmarsysConfigurationViewModel < ApplicationViewModel
      def masked_api_key
        return unless Workarea::Emarsys.secret_key.present?
        key = Workarea::Emarsys.secret_key
        last_digits = key.to_s.slice(-4..-1)
        "XXXXXXXXXX#{last_digits}"
      end

      def masked_sales_api_key
        return unless Workarea::Emarsys.api_token.present?
        key = Workarea::Emarsys.api_token
        last_digits = key.to_s.slice(-4..-1)
        "XXXXXXXXXX#{last_digits}"
      end

    end
  end
end
