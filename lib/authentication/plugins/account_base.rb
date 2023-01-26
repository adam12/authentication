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

      module InstanceMethods
        def lookup_account(username)
          db.from(config.accounts_table).first(config.username_column => username)
        end

        def lookup_account_by_id(id)
          db.from(config.accounts_table).first(id: id)
        end
      end
    end
  end
end
