class Authentication
  module Plugins
    autoload :AccountBase, __dir__ + "/plugins/account_base.rb"
    autoload :Core, __dir__ + "/plugins/core.rb"
    autoload :BCrypt, __dir__ + "/plugins/bcrypt.rb"
    autoload :ChangePassword, __dir__ + "/plugins/change_password.rb"
    autoload :CreateAccount, __dir__ + "/plugins/create_account.rb"
    autoload :Instrumenter, __dir__ + "/plugins/instrumenter.rb"
    autoload :SessionBase, __dir__ + "/plugins/session_base.rb"
  end
end
