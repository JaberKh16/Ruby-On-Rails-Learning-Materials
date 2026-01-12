class AddPasswordConfirmationToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :confirm_pass, :string
  end
end
