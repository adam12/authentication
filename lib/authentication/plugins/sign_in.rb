class Authentication
  module Errors
    # Username is not in system.
    UnknownUsername = Class.new(StandardError)

    # Password was not correct.
    IncorrectPassword = Class.new(StandardError)
  end

  module Plugins
    # Plugin for sign in functionality.
    module SignIn
      def self.before_load(mod, ...)
        mod.plugin AccountBase
        mod.plugin SessionBase
      end

      # Methods available on the instance of an Authentication class.
      module InstanceMethods
        # Sign in with +username+ and +password+, updating +session+ if
        # +username+ and +password+ are valid.
        #
        # Expects +session+ to be a Hash-like object.
        #
        # Returns Hash of account if successful.
        # If the +username+ does not exist, raise +Errors::UnknownUsername+.
        # If the +password+ is invalid, raise +Errors::IncorrectPassord+.
        def sign_in(username, password, session)
          account = lookup_account(username)

          if account.nil?
            instrument("authentication.sign_in.unknown_username", {username: username})
            raise Errors::UnknownUsername
          end

          if !validate_password(password, account[config.password_digest_column])
            instrument("authentication.sign_in.incorrect_password", {username: username})
            raise Errors::IncorrectPassword
          end

          instrument("authentication.sign_in", {username: username}) do
            signed_in(account, session)
          end

          account
        end

        # Set +account+ as signed in.
        #
        # Expects +session+ to be a Hash-like object.
        def signed_in(account, session)
          session[config.account_session_key.to_s] = account[:id]
        end
      end
    end
  end
end
