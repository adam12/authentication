require "test_init"

class Authentication
  module Plugins
    class TestSessionBase < PluginTest
      def test_account_from_session
        session = {"account_id" => 1}

        authentication = Class.new(Authentication) do
          plugin Authentication::Plugins::SessionBase
          config.db = DB
        end.new

        DB.autoid = 1
        DB.fetch = {id: 1, email: "user", password_digest: "foo"}

        assert authentication.account_from_session(session)
      end

      def test_account_from_session_missing_value
        session = {"account_id" => nil}

        authentication = Class.new(Authentication) do
          plugin Authentication::Plugins::SessionBase
          config.db = DB
        end.new

        DB.fetch = nil

        assert_raises(Errors::NoSession) do
          authentication.account_from_session(session)
        end
      end

      def test_account_from_session_invalid_account
        session = {"account_id" => 1}

        authentication = Class.new(Authentication) do
          plugin Authentication::Plugins::SessionBase
          config.db = DB
        end.new

        DB.fetch = nil

        assert_raises(Errors::InvalidAccount) do
          authentication.account_from_session(session)
        end
      end
    end
  end
end
