module Workarea
  module Emarsys
    class SaveEmailSignup
      include Sidekiq::Worker
      include Sidekiq::CallbacksWorker

      sidekiq_options(
        enqueue_on: { Workarea::Email::Signup => :create },
        queue: 'low'
      )

      def perform(id)
        email_signup = Workarea::Email::Signup.find(id)
        email = email_signup.email

        # Emarasys Key values are
        # integer, value
        # where integer corresponds to a field in their
        # internal database
        attrs = { contacts: [
            "3" => email,
            "31" => 1
          ]
        }
        response = gateway.create_contact(attrs)

        email_signup.update_attributes!(
          emarsys_exported_at: Time.current,
          emarsys_external_id: response.body["data"]["ids"].first
        )
      end

      private

        def gateway
          Emarsys.gateway
        end
    end
  end
end
