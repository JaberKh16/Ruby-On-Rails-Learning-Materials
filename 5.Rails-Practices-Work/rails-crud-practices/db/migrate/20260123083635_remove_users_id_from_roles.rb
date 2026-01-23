class RemoveUsersIdFromRoles < ActiveRecord::Migration[8.1]
  def change
    remove_column :roles, :users_id if column_exists?(:roles, :users_id)
  end
end
