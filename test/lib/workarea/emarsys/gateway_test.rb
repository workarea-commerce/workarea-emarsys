require "test_helper"

module Workarea
  module Emarsys
    class GatewayTest < Workarea::TestCase
      include EmarsysApiConfig

      def gateway
        customer_id = '215861890'
        Workarea::Emarsys::Gateway.new(
          Rails.application.secrets.emarsys[:secret_key],
          customer_id
        )
      end

      def test_create_contact
        VCR.use_cassette("emarsys/add_contact", match_requests_on: [:method, :uri]) do
          attrs = { contacts: [ "3" => "jyucis-emarsys@workarea.com" ] }
          response = gateway.create_contact(attrs)

          assert(response.success?)
        end
      end
    end
  end
end
