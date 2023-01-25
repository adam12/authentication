class Authentication
  module Plugins
    module Core
      def self.before_load(mod, *)
        require "securerandom"

        mod.class_eval do
          setting :db
        end
      end

      module ClassMethods
        def random_key
          SecureRandom.urlsafe_base64(32)
        end
      end
    end
  end
end
