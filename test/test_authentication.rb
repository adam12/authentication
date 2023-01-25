require "minitest/autorun"
require "authentication"

class TestAuthentication < Minitest::Test
  def test_new_instance
    authentication = Class.new(Authentication)

    assert authentication
  end
end
