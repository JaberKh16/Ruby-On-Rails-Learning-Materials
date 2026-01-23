class AddRoleToUsers < ActiveRecord::Migration[8.1]
  def up
    add_reference :users, :role, foreign_key: true, null: true

    # Find role id using SQL (works regardless of column name issues)
    role_id = execute(<<~SQL).first&.first
      SELECT id FROM roles
      WHERE role_name = 'user'
      LIMIT 1
    SQL

    if role_id
      execute <<~SQL
        UPDATE users
        SET role_id = #{role_id}
        WHERE role_id IS NULL
      SQL
    end

    change_column_null :users, :role_id, false
  end

  def down
    remove_reference :users, :role
  end
end
