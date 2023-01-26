require "test_init"

class Authentication
  module Plugins
    class TestSignOut < PluginTest
      def test_sign_out
        authentication = Class.new(Authentication) do
          plugin Authentication::Plugins::SignOut
          config.db = DB
        end.new

        session = {"account_id" => 1}

        assert authentication.sign_out(session)
        assert_nil session["account_id"]
      end
    end
  end
end
