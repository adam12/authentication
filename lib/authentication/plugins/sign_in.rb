class Authentication
  module Errors
    InvalidUsername = Class.new(StandardError)
    InvalidPassword = Class.new(StandardError)
  end

  module Plugins
    module SignIn
      def self.before_load(mod, ...)
        mod.plugin AccountBase
        mod.plugin SessionBase
      end

      module InstanceMethods
        def sign_in(username, password, session)
          instrument("authentication.sign_in", {username: username}) do
            account = lookup_account(username)

            raise Errors::InvalidUsername if account.nil?

            if !self.class.validate_password(password, account[config.password_digest_column])
              raise Errors::InvalidPassword
            end

            session[config.account_session_key.to_s] = account[:id]

            account
          end
        end
      end
    end
  end
end
