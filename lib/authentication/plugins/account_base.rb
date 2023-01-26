class Authentication
  module Plugins
    module AccountBase
      def self.before_load(mod, ...)
        mod.plugin BCrypt

        mod.class_eval do
          # Table that contains accounts
          setting :accounts_table, default: :accounts

          # Column in accounts table that contains username
          setting :username_column, default: :email

          # Column in accounts table that contains password digest
          setting :password_digest_column, default: :password_digest
        end
      end
    end
  end
end
