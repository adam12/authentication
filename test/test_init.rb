require "minitest/autorun"
require "authentication"
require "sequel"

class Authentication
  DB = Sequel.mock

  class Test < Minitest::Test
  end

  class PluginTest < Test
  end
end
