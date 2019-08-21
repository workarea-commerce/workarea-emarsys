module Workarea
  module Emarsys
    class SyncOrders
      include Sidekiq::Worker

      def perform
        # get the orders based on the time span set in config
        orders = Workarea::Order.emarsys_exportable

        return if orders.empty?

        Dir.mktmpdir do |dir|
          file = "order_export.csv"
          path = "#{dir}/#{file}"
          File.new(path, 'w+')

          CSV.open(path, "wb") do |csv|
            csv << headers
            orders.each do |order|
              order.items.each do |item|
                csv << order_line(item)
              end
            end
          end
          gateway.send_file(path)
        end
      end

      private
        def order_line(item)
          [
            item.order.id,
            item.order.email,
            item.product_id,
            item.total_price.to_s,
            item.quantity,
            item.order.placed_at.utc.iso8601
          ]
        end

        def headers
          ["order", "email", "item", "price", "quantity", "timestamp"]
        end

        def gateway
          Emarsys.sales_data_gateway
        end
    end
  end
end
