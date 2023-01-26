require "test_init"

class Authentication
  module Plugins
    class TestChangePassword < PluginTest
      def test_changing_password_of_valid_account
        authentication = Class.new(Authentication) do
          plugin Authentication::Plugins::ChangePassword
          config.db = DB
        end.new

        DB.autoid = 1
        DB.fetch = {id: 1, email: "user", password_digest: "foo"}

        assert authentication.change_password(1, "secret")
      end
    end
  end
end
