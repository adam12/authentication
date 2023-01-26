require "test_init"

class Authentication
  module Plugins
    class TestCore < PluginTest
      def test_random_key
        authentication = Class.new(Authentication)

        assert_equal 43, authentication.random_key.size
      end
    end
  end
end
