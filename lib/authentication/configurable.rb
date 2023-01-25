# frozen-string-literal: true

require "dry-configurable"

class Authentication
  module Configurable
    def self.extended(base)
      super

      base.extend Dry::Configurable
    end
  end
end
