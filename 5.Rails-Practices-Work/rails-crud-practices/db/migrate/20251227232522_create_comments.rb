class CreateComments < ActiveRecord::Migration[8.1]
  def change
    create_table :comments do |t|
      t.text :comment_msg
      t.string :attachment
      t.boolean :is_active

      t.timestamps
    end
  end
end
