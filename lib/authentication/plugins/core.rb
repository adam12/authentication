require "securerandom"

class Authentication
  module Plugins
    module Core
      module ClassMethods
        def random_key
          SecureRandom.urlsafe_base64(32)
        end
      end
    end
  end
end
