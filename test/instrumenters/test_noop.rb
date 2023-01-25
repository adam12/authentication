require "test_init"

class Authentication
  module Instrumenters
    class TestNoop < Minitest::Test
      def test_instrument_yields_payload
        Noop.instrument("test", {foo: "bar"}) do |payload|
          assert_equal({foo: "bar"}, payload)
        end
      end
    end
  end
end
