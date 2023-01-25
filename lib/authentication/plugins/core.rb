class Authentication
  module Plugins
    module Core
      def self.before_load(*)
        require "securerandom"
      end

      module ClassMethods
        def random_key
          SecureRandom.urlsafe_base64(32)
        end
      end
    end
  end
end
