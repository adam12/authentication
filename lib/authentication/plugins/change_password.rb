class Authentication
  module Plugins
    module ChangePassword
      def self.before_load(mod, ...)
        mod.plugin AccountBase
      end

      module InstanceMethods
        def change_password(account_id, new_password)
          instrument("authentication.change_password", {account_id: account_id}) do
            password_digest = self.class.digest_password(new_password)

            db.from(config.accounts_table)
              .where(id: account_id)
              .update(config.password_digest_column => password_digest)

            true
          end
        end
      end
    end
  end
end
