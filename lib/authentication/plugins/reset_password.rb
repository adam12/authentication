class Authentication
  module Errors
    InvalidPasswordResetKey = Class.new(StandardError)
  end

  module Plugins
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
