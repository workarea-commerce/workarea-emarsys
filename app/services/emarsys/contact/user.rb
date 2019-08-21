module Workarea
  module Emarsys
    class Contact
      class User
        attr_reader :user

        def initialize(user)
          @user = user
        end

        def email
          user.email
        end

        def first_name
          user.first_name
        end

        def last_name
          user.last_name
        end
      end
    end
  end
end
