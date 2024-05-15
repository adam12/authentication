require "test_init"

class Authentication
  module Plugins
    class TestCreateAccount < PluginTest
      def test_creating_account
        authentication = Class.new(Authentication) do
          plugin Authentication::Plugins::CreateAccount
          config.db = DB
          config.password_digest_column = :password_hash
        end.new

        assert authentication.create_account("user@example.com", "secret")
      end
    end
  end
end
