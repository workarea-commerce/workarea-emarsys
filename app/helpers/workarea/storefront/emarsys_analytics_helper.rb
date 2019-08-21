module Workarea
  module Storefront
    module EmarsysAnalyticsHelper
      def category_view_analytics_data(category)
        super.merge(emarsys_category_path: category.google_name)
      end

      def order_analytics_data(order)
        super.merge(emarsys_user_email: current_user&.email || order.email)
      end
    end
  end
end
