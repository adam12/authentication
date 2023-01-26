class Authentication
  module Plugins
    module SignOut
      def self.before_load(mod, ...)
        mod.plugin SessionBase
      end

      module InstanceMethods
        def sign_out(session)
          instrument("authentication.sign_out") do |payload|
            payload[:account_id] = session.delete(config.account_session_key.to_s)
          end
        end
      end
    end
  end
end
