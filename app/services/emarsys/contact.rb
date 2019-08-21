module Workarea
  module Emarsys
    class Contact
      attr_reader :model, :options

      def initialize(model, options = {})
        @model = model
        @options = options
      end

      # @return Hash
      def to_h
        user_data = {
          "1" => contact_model.first_name,
          "2" => contact_model.last_name,
          "3" => contact_model.email
        }

        if address.present?
          address_data = {
            "10" => address.street,
            "11" => address.city,
            "12" => address.region,
            "13" => address.postal_code,
            "14" => ::Emarsys::Country.new.find_code(address.country.to_s),
            "15" => address.phone_number
          }

          user_data.merge!(address_data)
        end

        user_data
      end

      private

        def address
          options[:address]
        end

        def contact_from
          options[:contact_from]
        end

        def contact_model
          if contact_from == "user"
            Contact::User.new(model)
          elsif contact_from == "order"
            Contact::Order.new(model)
          end
        end

    end
  end
end
