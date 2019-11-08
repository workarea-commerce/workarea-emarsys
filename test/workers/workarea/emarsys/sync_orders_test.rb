require 'test_helper'

module Workarea
  class Emarsys::SyncOrdersTest < TestCase
    include EmarsysApiConfig

    def test_sync_orders_sends_file
      merchant_id = "19CAA097101B372A"
      Workarea.config.merchant_id = merchant_id

      VCR.use_cassette("emarsys/sales/send_data", match_requests_on: [:method, :uri]) do
        api_url = "https://admin.scarabresearch.com/hapi/merchant/#{merchant_id}/sales-data/api"

        create_placed_order

        Workarea::Emarsys::SyncOrders.new.perform

        assert_requested :post, api_url
      end
    end

    def test_sync_orders_sends_nothing_when_no_orders
      merchant_id = "19CAA097101B372A"
      Workarea.config.merchant_id = merchant_id

      api_url = "https://admin.scarabresearch.com/hapi/merchant/#{merchant_id}/sales-data/api"
      Workarea::Emarsys::SyncOrders.new.perform

      refute_requested :post, api_url
    end
  end
end
