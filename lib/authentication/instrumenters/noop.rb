# frozen-string-literal: true

class Authentication
  module Instrumenters
    module Noop
      def self.instrument(name, payload = {})
        yield payload if defined?(yield)
      end
    end
  end
end
