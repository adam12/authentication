class Authentication
  ##
  # Namespace for plugins.
  module Plugins
    autoload :AccountBase, __dir__ + "/plugins/account_base.rb"
    autoload :Core, __dir__ + "/plugins/core.rb"
    autoload :BCrypt, __dir__ + "/plugins/bcrypt.rb"
    autoload :ChangePassword, __dir__ + "/plugins/change_password.rb"
    autoload :CreateAccount, __dir__ + "/plugins/create_account.rb"
    autoload :Instrumenter, __dir__ + "/plugins/instrumenter.rb"
    autoload :ResetPassword, __dir__ + "/plugins/reset_password.rb"
    autoload :SessionBase, __dir__ + "/plugins/session_base.rb"
    autoload :SignIn, __dir__ + "/plugins/sign_in.rb"
    autoload :SignOut, __dir__ + "/plugins/sign_out.rb"
  end
end
