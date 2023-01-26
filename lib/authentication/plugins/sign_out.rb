class Authentication
  module Plugins
    ##
    # Plugin for sign-out functionality.
    module SignOut
      def self.before_load(mod, ...)
        mod.plugin SessionBase
      end

      ##
      # Methods available on the instance of an Authentication class.
      module InstanceMethods
        ##
        # Sign out any active user.
        #
        # Expects +session+ to be a Hash-like object.
        def sign_out(session)
          instrument("authentication.sign_out") do |payload|
            payload[:account_id] = session.delete(config.account_session_key.to_s)
          end
        end
      end
    end
  end
end
