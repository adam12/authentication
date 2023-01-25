class Authentication
  module Plugins
    module BCrypt
      def self.before_load(*)
        require "bcrypt"
      end

      module ClassMethods
        def digest_password(password)
          ::BCrypt::Password.create(password)
        end

        def validate_password(plain, digest)
          ::BCrypt::Password.new(digest) == plain
        end
      end
    end
  end
end
