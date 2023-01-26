class Authentication
  module Plugins
    autoload :AccountBase, __dir__ + "/plugins/account_base.rb"
    autoload :Core, __dir__ + "/plugins/core.rb"
    autoload :BCrypt, __dir__ + "/plugins/bcrypt.rb"
    autoload :CreateAccount, __dir__ + "/plugins/create_account.rb"
    autoload :Instrumenter, __dir__ + "/plugins/instrumenter.rb"
  end
end
