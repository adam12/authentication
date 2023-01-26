class Authentication
  module Plugins
    ##
    # Base plugin for all account-related functionality.
    #
    # Specifically, shared concerns around where accounts are stored,
    # the username column, password digest column, and how to look up
    # accounts.
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
        ##
        # Lookup account by +username+
        #
        # Returns Hash of account, or nil if not found.
        def lookup_account(username)
          db.from(config.accounts_table).first(config.username_column => username)
        end

        ##
        # Lookup account by primary key +id+
        #
        # Returns Hash of account, or nil if not found.
        def lookup_account_by_id(id)
          db.from(config.accounts_table).first(id: id)
        end
      end
    end
  end
end
