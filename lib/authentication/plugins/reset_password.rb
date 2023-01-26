class Authentication
  module Errors
    # Password reset key was not found
    InvalidPasswordResetKey = Class.new(StandardError)
  end

  module Plugins
    ##
    # Plugin for resetting passwords of accounts
    #
    # Example flow
    #
    #   request_id = user_authentication.reset_password_request("user@example.com")
    #
    #   # Send request_id to user to confirm, bringing them back to app
    #
    #   user_authentication.reset_password(request_id, "their-new-password")
    module ResetPassword
      def self.before_load(mod, ...)
        mod.plugin AccountBase

        mod.class_eval do
          setting :password_resets_table, default: :account_password_reset_keys
          setting :password_resets_table_pk, default: :id
          setting :password_resets_table_key, default: :key
        end
      end

      module InstanceMethods
        ##
        # Reset password using provided +request_id+ and +new_password+
        #
        # Returns true if successful.
        # Raises Errors::InvalidPasswordResetKey if the +request_id+ is not found
        def reset_password(request_id, new_password)
          instrument("authentication.reset_password", {request_id: request_id}) do
            password_digest = self.class.digest_password(new_password)

            account_id = db.from(config.password_resets_table)
              .where(config.password_resets_table_key => request_id)
              .get(config.password_resets_table_pk)

            raise Errors::InvalidPasswordResetKey if account_id.nil?

            db.from(config.accounts_table)
              .where(id: account_id)
              .update(config.password_digest_column => password_digest)

            true
          end
        end

        ##
        # Generate a reset password request for +username+
        #
        # Returns the generated +request_id+ which can be used as part of the
        # notification to the User.
        def reset_password_request(username)
          instrument("authentication.reset_password_request", {username: username}) do
            account = lookup_account(username)
            request_id = self.class.random_key

            db.from(config.password_resets_table).insert({
              config.password_resets_table_pk => account[:id],
              config.password_resets_table_key => request_id
            })

            request_id
          end
        end

        ##
        # Look up account for given +request_id+ to then be used to change password.
        def account_for_reset_password_request(request_id)
          instrument("authentication.account_for_reset_password_request", {request_id: request_id}) do
            account_id = db.from(config.password_resets_table)
              .where(config.password_resets_table_key => request_id)
              .get(config.password_resets_table_pk)

            lookup_account_by_id(account_id)
          end
        end
      end
    end
  end
end
