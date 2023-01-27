class Authentication
  module Plugins
    ##
    # Plugin for creating accounts.
    #
    #   class UserAuthentication < Authentication
    #     plugin Authentication::Plugins::CreateAccount
    #   end
    #
    #   user_authentication = UserAuthentication.new
    #   user_authentication.create_account("user@example.com", "secret") # => {id: 1, ...}
    module CreateAccount
      def self.before_load(mod, ...)
        mod.plugin AccountBase
      end

      ##
      # Methods available on the instance of an Authentication class.
      module InstanceMethods
        ##
        # Create account with +username+ and +password+.
        #
        # Returns Hash of account created.
        def create_account(username, password)
          instrument("authentication.create_account", {username: username}) do
            id =
              db
                .from(config.accounts_table)
                .insert({
                  config.username_column => username,
                  config.password_digest_column => digest_password(password)
                })

            db.from(config.accounts_table).where(id: id).single_record
          end
        end
      end
    end
  end
end
