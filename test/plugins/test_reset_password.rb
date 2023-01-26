require "test_init"

class Authentication
  module Plugins
    class TestResetPassword < Minitest::Test
      def test_reset_password_invalid_request_id
        authentication = Class.new(Authentication) do
          plugin Authentication::Plugins::ResetPassword
          config.db = DB
        end.new

        DB.fetch = nil

        assert_raises(Errors::InvalidPasswordResetKey) do
          authentication.reset_password("the-request-id", "secret")
        end
      end

      def test_reset_password_valid_request_id
        authentication = Class.new(Authentication) do
          plugin Authentication::Plugins::ResetPassword
          config.db = DB
        end.new

        DB.autoid = 1
        DB.fetch = {id: 1}

        assert authentication.reset_password("the-request-id", "secret")
      end

      def test_reset_password_request
        authentication = Class.new(Authentication) do
          plugin Authentication::Plugins::ResetPassword
          config.db = DB
        end.new

        DB.autoid = 1
        DB.fetch = {id: 1}

        refute_nil authentication.reset_password_request("the-username")
      end

      def test_account_for_reset_password_request
        authentication = Class.new(Authentication) do
          plugin Authentication::Plugins::ResetPassword
          config.db = DB
        end.new

        DB.autoid = 1
        DB.fetch = {id: 1}

        assert authentication.account_for_reset_password_request("the-request-id")
      end
    end
  end
end
