require "test_init"

class Authentication
  module Plugins
    class TestResetPassword < PluginTest
      def test_reset_password_invalid_request_id
        authentication = build_authentication

        assert_raises(Errors::InvalidPasswordResetKey) do
          authentication.reset_password("the-request-id", "secret")
        end
      end

      def test_reset_password_valid_request_id
        authentication = build_authentication
        account = create_account

        create_password_reset_key(account: account, key: "the-request-id")

        assert authentication.reset_password("the-request-id", "secret")
      end

      def test_reset_password_request
        authentication = build_authentication
        account = create_account

        refute_nil authentication.reset_password_request(account[:email])
      end

      def test_account_for_reset_password_request
        authentication = build_authentication
        account = create_account

        create_password_reset_key(key: "the-request-id", account: account)

        assert authentication.account_for_reset_password_request("the-request-id")
      end

      private

      def create_password_reset_key(key:, account:)
        DB[:account_password_reset_keys].insert({id: account[:id], key: key})
      end

      def build_authentication
        Class.new(Authentication) do
          plugin Authentication::Plugins::ResetPassword
          config.db = DB
          config.password_digest_column = :password_hash
        end.new
      end
    end
  end
end
