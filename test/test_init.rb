ENV["COVERAGE"] ||= "PartialSummary"
require "covered/minitest"
require "minitest/autorun"
require "authentication"
require "sequel"
require "bcrypt"

BCrypt::Engine.cost = 1
Sequel.extension :migration

class Authentication
  DB = Sequel.sqlite

  Sequel::Migrator.run(DB, "template")

  class Test < Minitest::Test
    def run
      DB.transaction(rollback: :always, auto_savepoint: true) do
        super
      end
    end

    def create_account(email: "user@example.com", password: "secret", status_id: 2)
      password_hash = ::BCrypt::Password.create(password)
      id = DB[:accounts].insert({status_id: status_id, password_hash: password_hash, email: email})
      DB[:accounts].first(id: id)
    end
  end

  class PluginTest < Test
  end
end
