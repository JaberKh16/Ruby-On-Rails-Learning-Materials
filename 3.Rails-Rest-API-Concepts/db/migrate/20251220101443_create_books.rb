class CreateBooks < ActiveRecord::Migration[8.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.string :author
      t.decimal :price
      t.string :description
      t.datetime :published_at

      t.timestamps
    end
  end
end
