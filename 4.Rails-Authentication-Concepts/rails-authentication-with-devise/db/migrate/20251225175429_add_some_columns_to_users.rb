class AddSomeColumnsToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :first_name, :string, null: true
    add_column :users, :last_name, :string, null: true
    add_column :users, :user_name, :string, null: true
    add_column :users, :nid, :string, null: true
    add_column :users, :is_active_status, :boolean, default: true
    
    # Add indexes
    add_index :users, :user_name, unique: true
    add_index :users, :nid, unique: true
    add_index :users, :is_active_status
  end
end