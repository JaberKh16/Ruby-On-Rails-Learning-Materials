class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :confirm_pass
      t.string :profile_img
      t.boolean :is_active

      t.timestamps
    end
  end
end
