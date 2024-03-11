Sequel.migration do
  up do
    extension :date_arithmetic

    db = self

    # Used by the account verification and close account features
    create_table(:account_statuses) do
      Integer :id, primary_key: true
      String :name, null: false, unique: true
    end
    from(:account_statuses).import([:id, :name], [[1, "Unverified"], [2, "Verified"], [3, "Closed"]])

    create_table(:accounts) do
      primary_key :id, type: :Bignum
      foreign_key :status_id, :account_statuses, null: false, default: 1
      String :password_hash, null: false

      if db.database_type == :postgres
        citext :email, null: false
        constraint :valid_email, email: /^[^,;@ \r\n]+@[^,@; \r\n]+\.[^,@; \r\n]+$/
      else
        String :email, null: false
      end
      if db.supports_partial_indexes?
        index :email, unique: true, where: {status_id: [1, 2]}
      else
        index :email, unique: true
      end
    end

    deadline_opts = proc do |days|
      if database_type == :mysql
        {null: false}
      else
        {null: false, default: Sequel.date_add(Sequel::CURRENT_TIMESTAMP, days: days)}
      end
    end

    # Used by the password reset feature
    create_table(:account_password_reset_keys) do
      foreign_key :id, :accounts, primary_key: true, type: :Bignum
      String :key, null: false
      DateTime :deadline, deadline_opts[1]
      DateTime :email_last_sent, null: false, default: Sequel::CURRENT_TIMESTAMP
    end
  end

  down do
    drop_table :account_password_reset_keys
    drop_table :accounts
    drop_table :account_statuses
  end
end
