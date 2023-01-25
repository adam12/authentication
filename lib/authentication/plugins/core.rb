class Authentication
  module Plugins
    module Core
      def self.before_load(mod, *)
        require "securerandom"
        require "authentication/instrumenters/noop"

        mod.class_eval do
          setting :db
          setting :instrumenter, default: -> { Instrumenters::Noop }
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
