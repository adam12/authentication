# frozen-string-literal: true

class Authentication
  ##
  # Configuration mixin.
  module Configurable
    module ClassMethods
      ##
      # Define new configuration setting
      #
      # Uses the provided +key+ and optional +default+.
      #
      # If +reader+ is true, then an accessor will be defined on the base
      # class to fetch the value from the config.
      #
      # == Examples
      # setting :db, reader: true
      # setting :accounts_table, default: :accounts_table
      def setting(key, default: nil, reader: false)
        config.define_singleton_method(key) do
          instance_variable_get(:@__settings__)[key]
        end

        config.define_singleton_method("#{key}=") do |value|
          instance_variable_get(:@__settings__)[key] = value
        end

        if reader
          define_singleton_method(key) do
            config.send(key)
          end
        end

        config.send("#{key}=", default)
      end

      def config
        @__config__ ||= Object.new.tap do |config|
          config.instance_variable_set(:@__settings__, {})
        end
      end

      def inherited(subclass)
        super

        subclass.instance_variable_set :@__config__, @__config__.clone

        # Clone settings to allow subclasses to have own settings
        subclass.config.instance_variable_set :@__settings__, @__config__.instance_variable_get(:@__settings__).clone
      end
    end

    def self.extended(base)
      super

      base.extend ClassMethods
    end
  end
end
