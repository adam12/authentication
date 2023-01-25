require_relative "authentication/plugins"
require_relative "authentication/configurable"
require_relative "authentication/version"

class Authentication
  extend Configurable

  def self.plugin(mod, ...)
    mod.before_load(self, ...) if mod.respond_to?(:before_load)

    if defined?(mod::InstanceMethods)
      include(mod::InstanceMethods)
    end

    if defined?(mod::ClassMethods)
      extend(mod::ClassMethods)
    end

    mod.after_load(self, ...) if mod.respond_to?(:after_load)
  end

  plugin Authentication::Plugins::Core
end
