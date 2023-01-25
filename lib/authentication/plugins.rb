class Authentication
  module Plugins
    autoload :Core, __dir__ + "/plugins/core.rb"
    autoload :BCrypt, __dir__ + "/plugins/bcrypt.rb"
  end
end
