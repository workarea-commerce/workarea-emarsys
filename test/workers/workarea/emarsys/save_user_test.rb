require 'test_helper'

module Workarea
  class Emarsys::SaveUserTest < TestCase

    def test_save_user_sets_time_stamp
      Workarea::Emarsys::Configuration.create(customer_id: '1234')
      user = create_user

      Workarea::Emarsys::SaveUser.new.perform(user.id)

      user.reload

      assert(user.emarsys_exported_at.present?)
      assert(user.emarsys_external_id.present?)
    end

    def test_save_user_does_nothing_without_customer_id_set
      Workarea::Emarsys::Configuration.create(customer_id: nil)
      user = create_user

      Workarea::Emarsys::SaveUser.new.perform(user.id)

      user.reload

      refute(user.emarsys_exported_at.present?)
      refute(user.emarsys_external_id.present?)
    end
  end
end
