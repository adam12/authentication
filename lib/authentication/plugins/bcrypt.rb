class Authentication
  module Plugins
    ##
    # Methods for validating and creating BCrypt password digests
    module BCrypt
      def self.before_load(*)
        require "bcrypt"
      end

      module ClassMethods
        ##
        # Convert string +password+ into BCrypt digest
        def digest_password(password)
          ::BCrypt::Password.create(password)
        end

        ##
        # Validate +plain+ password against +digest+
        def validate_password(plain, digest)
          ::BCrypt::Password.new(digest) == plain
        end
      end
    end
  end
end
