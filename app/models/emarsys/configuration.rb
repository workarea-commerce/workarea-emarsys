module Workarea
  module Emarsys
    class Configuration
      include ApplicationDocument

      field :merchant_id, type: String
      field :customer_id, type: String

      field :production, type: Boolean, default: false

      def self.current
        first || new
      end
    end
  end
end
