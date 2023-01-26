require "test_init"

class Authentication
  module Plugins
    class TestCreateAccount < Minitest::Test
      def test_creating_account
        authentication = Class.new(Authentication) do
          plugin Authentication::Plugins::CreateAccount
          config.db = DB
        end.new

        DB.autoid = 1
        DB.fetch = {id: 1, email: "user", password_digest: "foo"}
        assert authentication.create_account("user@example.com", "secret")
      end
    end
  end
end
