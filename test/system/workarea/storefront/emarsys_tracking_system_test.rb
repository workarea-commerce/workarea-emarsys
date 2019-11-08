require 'test_helper'

module Workarea
  module Storefront
    class EmarsysTrackingSystemTest < Workarea::SystemTest
      def test_emarsys_tracking_js
        Workarea.config.merchant_id = 'abcdefg'
        visit storefront.root_path

        emarsys_script = find('script', text: 'abcdefg', visible: false)

        assert(emarsys_script.present?)

        Workarea.config.merchant_id = nil

        visit storefront.root_path
        emarsys_script = find('script', text: 'abcdefg', visible: false) rescue nil
        refute(emarsys_script.present?)
      end
    end
  end
end
