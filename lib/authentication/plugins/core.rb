class Authentication
  module Plugins
    # Core plugin with basic setup of always-required functionality.
    module Core
      def self.before_load(mod, *)
        require "securerandom"

        mod.class_eval do
          # Store a Sequel database connection.
          setting :db, reader: true
        end
      end

      # Methods available on the instance of an Authentication class.
      module InstanceMethods
        # URL-safe random key.
        def random_key
          SecureRandom.urlsafe_base64(32)
        end

        # Shortcut to `db` config value.
        def db
          self.class.db
        end

        # Shortcut to `config` value on class.
        def config
          self.class.config
        end
      end
    end
  end
end
