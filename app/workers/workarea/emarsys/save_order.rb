module Workarea
  module Emarsys
    class SaveOrderContact
      include Sidekiq::Worker
      include Sidekiq::CallbacksWorker

      sidekiq_options(
        enqueue_on: { Workarea::Order => [:place] },
        unique: :until_executing
      )

      def perform(id)
        return unless Emarsys.customer_id.present?

        order = Workarea::Order.find(id)
        address = Workarea::Payment.find(order.id).address

        attrs = Emarsys::Contact.new(order, address: address, contact_from: 'order').to_h
        gateway.create_contact(attrs)
      end

      private

        def gateway
          Emarsys.gateway
        end
    end
  end
end
