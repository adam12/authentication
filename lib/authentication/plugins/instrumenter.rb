class Authentication
  module Plugins
    # Plugin for instrumenting calls to various methods.
    #
    # Accepts an instrumenter that matches the signature of ActiveSupport::Notifications.
    module Instrumenter
      # An instrumenter that does nothing.
      module Noop
        def self.instrument(name, payload = {})
          yield payload if defined?(yield)
        end
      end

      def self.before_load(mod, ...)
        mod.class_eval do
          # Store an intrumenter.
          setting :instrumenter, reader: true, default: Noop
        end
      end

      # Methods available on the instance of an Authentication class.
      module InstanceMethods
        # Instrument the provided block.
        #
        # The actual implementation is instrument provider specific, but it is
        # expected that the instrumenter returns the value of the block.
        #
        # :call-seq:
        #   instrument(name, payload = {})
        def instrument(...)
          self.class.instrumenter.instrument(...)
        end
      end
    end
  end
end
