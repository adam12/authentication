require_relative "authentication/plugins"
require_relative "authentication/configurable"
require_relative "authentication/version"

class Authentication
  extend Configurable

  ##
  # Load plugin +mod+
  #
  # If +mod+ includes an InstanceMethods module, include that module into the
  # authentication class. Similarly, if +mod+ includes a ClassMethods module,
  # extend the authentication class with said module.
  #
  # Before loading +mod+, call +before_load+ if possible. After loading +mod+,
  # call +after_load+ if possible.
  #
  # Any additional arguments or blocks passed to +plugin+ are forwaded to the
  # plugin hooks.
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
  plugin Authentication::Plugins::Instrumenter
end
