class Authentication
  module Plugins
    ##
    # Methods for validating and creating BCrypt password digests.
    module BCrypt
      def self.before_load(*)
        require "bcrypt"
      end

      ##
      # Methods available on the class of an Authentication subclass.
      module ClassMethods
        ##
        # Convert string +password+ into BCrypt digest.
        #
        # :call-seq:
        #   digest_password(password) -> string
        def digest_password(password)
          ::BCrypt::Password.create(password)
        end

        ##
        # Validate +plain+ password against +digest+. Returns +false+ if the
        # plain value does not match the digest.
        #
        # :call-seq:
        #   validate_password(plain, digest) -> true
        #   validate_password(invalid, digest) -> false
        def validate_password(plain, digest)
          ::BCrypt::Password.new(digest) == plain
        end
      end
    end
  end
end
