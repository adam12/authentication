class Authentication
  module Plugins
    module Instrumenter
      module Noop
        def self.instrument(name, payload = {})
          yield payload if defined?(yield)
        end
      end

      def self.before_load(mod, ...)
        mod.class_eval do
          setting :instrumenter, reader: true, default: Noop
        end
      end

      module InstanceMethods
        def instrument(...)
          self.class.instrumenter.instrument(...)
        end
      end
    end
  end
end
