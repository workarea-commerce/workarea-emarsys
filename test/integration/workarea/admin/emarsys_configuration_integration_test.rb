require 'test_helper'

module Workarea
  module Admin
    class EmarsysConfigurationIntegrationTest < Workarea::IntegrationTest
      include Admin::IntegrationTest

      def test_create_configuration
        patch admin.emarsys_configuration_path,
             params: {
               customer_id: '12345',
               merchant_id: 'ABCDEFG',
               production: true
             }

        assert_equal(1, Workarea::Emarsys::Configuration.count)

        result = Workarea::Emarsys::Configuration.current
        assert_equal('12345', result.customer_id)
        assert_equal('ABCDEFG', result.merchant_id)
        assert(result.production?)
      end
    end
  end
end
