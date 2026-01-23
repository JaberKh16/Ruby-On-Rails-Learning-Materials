class RenameRoleNameToNameInRoles < ActiveRecord::Migration[8.1]
  # def change
  #   # rename_column :table_name, :old_column_name, :new_column_name
  #   # rename_column :roles, :role_name, :name
  #   #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  # end

  def up
    if column_exists?(:roles, :role_name)
      rename_column :roles, :role_name, :name
    end
  end

  def down
    if column_exists?(:roles, :name)
      rename_column :roles, :name, :role_name
    end
  end
end
