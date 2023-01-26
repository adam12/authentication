class Authentication
  module Plugins
    module Core
      def self.before_load(mod, *)
        require "securerandom"
        require "authentication/instrumenters/noop"

        mod.class_eval do
          setting :db, reader: true
          setting :instrumenter, default: Instrumenters::Noop
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

        def instrument(...)
          config.instrumenter.instrument(...)
        end
      end
    end
  end
end
