class Authentication
  module Plugins
    module Core
      def self.before_load(mod, *)
        require "securerandom"

        mod.class_eval do
          setting :db, reader: true
        end
      end

      module ClassMethods
        def random_key
          SecureRandom.urlsafe_base64(32)
        end
      end

      module InstanceMethods
        def db
          self.class.db
        end

        def config
          self.class.config
        end
      end
    end
  end
end
