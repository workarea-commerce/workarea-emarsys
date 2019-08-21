module Workarea
  module Emarsys
    class SaveUser
      include Sidekiq::Worker
      include Sidekiq::CallbacksWorker

      sidekiq_options(
        enqueue_on: { Workarea::User => :save },
        queue: 'low'
      )

      def perform(id)
        return unless settings.customer_id.present?

        user = Workarea::User.find(id)

        attrs = Emarsys::Contact.new(user, { address: address(user), contact_from: 'user' }).to_h

        response = gateway.create_contact(attrs)

        user.set(emarsys_exported_at: Time.current)
        external_id = response.body["data"]["id"] || response.body["data"]["ids"].first
        user.set(emarsys_external_id: external_id)
      end

      private

        def gateway
          Emarsys.gateway
        end

        def settings
          Workarea::Emarsys::Configuration.current
        end

        def address(user)
          return unless user.addresses.present?

          return user.default_billing_address if user.default_billing_address.present?
          user.addresses.sort_by { |a| a.created_at.to_i }.last
        end
    end
  end
end
