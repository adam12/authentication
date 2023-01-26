class Authentication
  module Plugins
    ##
    # Plugin for changing account passwords.
    #
    #   class UserAuthentication < Authentication
    #     plugin Authentication::Plugins::ChangePassword
    #   end
    #
    #   user_authentication = UserAuthentication.new
    #   user_authentication.change_password(1, "new-password") # => true
    module ChangePassword
      def self.before_load(mod, ...)
        mod.plugin AccountBase
      end

      ##
      # Methods available on the instance of an Authentication class.
      module InstanceMethods
        ##
        # Change password for +account_id+.
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
