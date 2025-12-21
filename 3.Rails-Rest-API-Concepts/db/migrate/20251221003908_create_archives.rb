class CreateArchives < ActiveRecord::Migration[8.1]
  def change
    create_table :archives do |t|
      t.string :name, null: false
      t.references :book, null: false, foreign_key: true
      t.string :archive_type, null: false
      t.datetime :archive_date, null: false

      t.timestamps
    end
  end
end
