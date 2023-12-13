require_relative "../test_init"
require "authentication/configurable"

class Authentication
  class TestConfigurable < Authentication::Test
    def test_setting_base_class
      klass = Class.new do
        extend Configurable

        setting :the_key, default: "the-default"
      end

      assert_equal "the-default", klass.config.the_key
    end

    def test_setting_inherited
      base = Class.new do
        extend Configurable

        setting :the_key
      end

      subclass = Class.new(base)

      base.config.the_key = "one"
      subclass.config.the_key = "two"

      assert_equal "one", base.config.the_key
      assert_equal "two", subclass.config.the_key
    end
  end
end
