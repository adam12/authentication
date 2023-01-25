require_relative "test_init"

class TestAuthentication < Minitest::Test
  def test_new_instance
    authentication = Class.new(Authentication)

    assert authentication
  end
end
