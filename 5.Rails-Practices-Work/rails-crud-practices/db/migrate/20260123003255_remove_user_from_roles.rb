class RemoveUserFromRoles < ActiveRecord::Migration[8.1]
  def change
    # Remove FK first
    remove_foreign_key :roles, :users rescue nil

    # Remove column
    remove_reference :roles, :user, index: true rescue nil
  end
end
