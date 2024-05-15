require "test_init"

class Authentication
  module Plugins
    class TestChangePassword < PluginTest
      def test_changing_password_of_valid_account
        authentication = Class.new(Authentication) do
          plugin Authentication::Plugins::ChangePassword
          config.db = DB
          config.password_digest_column = :password_hash
        end.new

        create_account(email: "user")

        assert authentication.change_password(1, "secret")
      end
    end
  end
end
