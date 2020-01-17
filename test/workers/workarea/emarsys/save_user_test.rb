require 'test_helper'

module Workarea
  class Emarsys::SaveUserTest < TestCase
    def test_save_user_sets_time_stamp
      user = create_user

      Workarea::Emarsys::SaveUser.new.perform(user.id)

      user.reload

      assert(user.emarsys_exported_at.present?)
      assert(user.emarsys_external_id.present?)
    end
  end
end
