module Workarea
  module Emarsys
    class Contact
      class Order
        attr_reader :order

        def initialize(order)
          @order = order
        end

        def email
          order.email
        end

        def first_name
          payment.address.first_name
        end

        def last_name
          payment.address.last_name
        end

        private

          def payment
            Workarea::Payment.find(order.id)
          end
        end
    end
  end
end
