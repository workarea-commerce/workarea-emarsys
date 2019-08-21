module Workarea
  module EmarsysApiConfig
    def self.included(test)
      super
      test.setup :set_key
      test.teardown :reset_key
    end

    def set_key
      Rails.application.secrets.emarsys = {
        secret_key: "a"
      }
    end

    def reset_key
      Rails.application.secrets.delete(:emarsys)
    end
  end
end
