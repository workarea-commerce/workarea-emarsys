require 'test_helper'

module Workarea
  module Emarsys
    class ContactTest < Workarea::TestCase
      def test_to_h
        user = create_user
        address = Address.new(address_params)

        hash = Workarea::Emarsys::Contact.new(user, address: address, contact_from: 'user').to_h
        assert_equal(user.email, hash["3"])
        assert_equal(user.first_name, hash["1"])
        assert_equal(user.last_name, hash["2"])

        assert_equal(address.street, hash["10"])
        assert_equal(address.city, hash["11"])
        assert_equal(address.region, hash["12"])
        assert_equal(address.postal_code, hash["13"])
        assert_equal(185, hash["14"])
        assert_equal(address.phone_number, hash["15"])
      end

      private

      def address_params
        if defined?(factory_defaults) # Workarea > v3.4 only
          factory_defaults(:billing_address).merge(phone_number: '215 555 5555')
        else
          {
            first_name: 'Ben',
            last_name: 'Crouse',
            street: '22 S. 3rd St.',
            street_2: 'Second Floor',
            city: 'Philadelphia',
            region: 'PA',
            postal_code: '19106',
            country: 'US',
            phone_number: '215 555 5555'
          }
        end
      end
    end
  end
end
