class Authentication
  module Errors
    # Username is not in system.
    UnknownUsername = Class.new(StandardError)

    # Password was not correct.
    IncorrectPassword = Class.new(StandardError)
  end

  module Plugins
    ##
    # Plugin for sign in functionality.
    module SignIn
      def self.before_load(mod, ...)
        mod.plugin AccountBase
        mod.plugin SessionBase
      end

      ##
      # Methods available on the instance of an Authentication class.
      module InstanceMethods
        ##
        # Sign in with +username+ and +password+, updating +session+ if
        # +username+ and +password+ are valid.
        #
        # Expects +session+ to be a Hash-like object.
        #
        # Returns Hash of account if successful.
        # If the +username+ does not exist, raise +Errors::UnknownUsername+.
        # If the +password+ is invalid, raise +Errors::IncorrectPassord+.
        def sign_in(username, password, session)
          instrument("authentication.sign_in", {username: username}) do
            account = lookup_account(username)

            raise Errors::UnknownUsername if account.nil?

            if !validate_password(password, account[config.password_digest_column])
              raise Errors::IncorrectPassword
            end

            session[config.account_session_key.to_s] = account[:id]

            account
          end
        end
      end
    end
  end
end
