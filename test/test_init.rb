require "minitest/autorun"
require "authentication"
require "sequel"
require "bcrypt"

BCrypt::Engine.cost = 1

class Authentication
  DB = Sequel.mock

  class Test < Minitest::Test
  end

  class PluginTest < Test
  end
end
