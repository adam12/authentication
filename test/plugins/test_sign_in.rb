require "test_init"

class Authentication
  module Plugins
    class TestSignIn < PluginTest
      def test_sign_in
        authentication = Class.new(Authentication) do
          plugin Authentication::Plugins::SignIn
          config.db = DB
        end.new

        DB.autoid = 1
        DB.fetch = {id: 1, password_digest: ::BCrypt::Password.create("password", cost: 1)}
        session = {}

        assert authentication.sign_in("username", "password", session)
        assert_equal 1, session["account_id"], "Session wasn't set correctly"
      end

      def test_sign_in_unknown_username
        authentication = Class.new(Authentication) do
          plugin Authentication::Plugins::SignIn
          config.db = DB
        end.new

        DB.autoid = 1
        DB.fetch = nil
        session = {}

        assert_raises(Errors::UnknownUsername) do
          authentication.sign_in("username", "password", session)
        end

        assert_nil session["account_id"]
      end

      def test_sign_in_incorrect_password
        authentication = Class.new(Authentication) do
          plugin Authentication::Plugins::SignIn
          config.db = DB
        end.new

        DB.autoid = 1
        DB.fetch = {id: 1, password_digest: ::BCrypt::Password.create("password", cost: 1)}
        session = {}

        assert_raises(Errors::IncorrectPassword) do
          authentication.sign_in("username", "invalid", session)
        end

        assert_nil session["account_id"]
      end
    end
  end
end
