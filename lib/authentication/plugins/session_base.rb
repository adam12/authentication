# frozen-string-literal: true

class Authentication
  module Errors
    # Session does not contain an account identifer value.
    NoSession = Class.new(StandardError)

    # Session contains an account identifier but it was not in database.
    InvalidAccount = Class.new(StandardError)
  end

  module Plugins
    ##
    # Plugin for common functionality involving sessions.
    #
    # Expects +session+ to be a Hash or object of similar interface.
    module SessionBase
      def self.before_load(mod, ...)
        mod.plugin AccountBase

        mod.class_eval do
          setting :account_session_key, default: :account_id
        end
      end

      ##
      # Methods available on the instance of an Authentication class.
      module InstanceMethods
        ##
        # Look up account from +session+.
        #
        # Returns a Hash of the account record.
        # If the session doesn't contain a value, Errors::NoSession is raised.
        # If the session contains a value but there is no account, Authentication::Errors::InvalidAccount is raised.
        def account_from_session(session)
          account_id = session[config.account_session_key.to_s]
          raise Errors::NoSession if account_id.nil?

          account = db.from(config.accounts_table).first(id: account_id)
          raise Errors::InvalidAccount if account.nil?

          account
        end
      end
    end
  end
end
