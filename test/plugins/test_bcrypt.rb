require "test_init"

class Authentication
  module Plugins
    class TestBCrypt < PluginTest
      def test_digest_password
        authentication = Class.new(Authentication) do
          plugin Authentication::Plugins::BCrypt
        end.new

        assert authentication.digest_password("secret").start_with?("$2a")
      end

      def test_validate_password
        authentication = Class.new(Authentication) do
          plugin BCrypt
        end.new

        secret = "$2a$12$02a6a8DlxrT6aMUh5/QrjuE5ERDz57I0hl80ryBgj.DiT4BLiCvFO"

        assert authentication.validate_password("secret", secret)
      end
    end
  end
end
