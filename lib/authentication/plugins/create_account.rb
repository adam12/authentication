class Authentication
  module Plugins
    module CreateAccount
      def self.before_load(mod, ...)
        mod.plugin AccountBase
      end

      module InstanceMethods
        def create_account(username, password)
          instrument("authentication.create_account", {username: username}) do
            id =
              db
              .from(config.accounts_table)
              .insert({
                config.username_column => username,
                config.password_digest_column => self.class.digest_password(password)
              })

            db.from(config.accounts_table).where(id: id).single_record
          end
        end
      end
    end
  end
end