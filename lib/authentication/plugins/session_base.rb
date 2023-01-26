# frozen-string-literal: true

class Authentication
  module Errors
    NoSession = Class.new(StandardError)
    InvalidAccount = Class.new(StandardError)
  end

  module Plugins
    module SessionBase
      def self.before_load(mod, ...)
        mod.plugin AccountBase

        mod.class_eval do
          setting :account_session_key, default: :account_id
        end
      end

      module InstanceMethods
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
