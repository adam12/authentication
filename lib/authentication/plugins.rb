class Authentication
  module Plugins
    autoload :AccountBase, __dir__ + "/plugins/account_base.rb"
    autoload :Core, __dir__ + "/plugins/core.rb"
    autoload :BCrypt, __dir__ + "/plugins/bcrypt.rb"
  end
end
