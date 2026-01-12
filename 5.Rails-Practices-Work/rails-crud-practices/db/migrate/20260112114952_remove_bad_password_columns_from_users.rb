class RemoveBadPasswordColumnsFromUsers < ActiveRecord::Migration[8.1]
  def change
    remove_column :users, :password, :string
    remove_column :users, :confirm_pass, :string
    # remove_column :users, :password_hash, :string
  end
end
