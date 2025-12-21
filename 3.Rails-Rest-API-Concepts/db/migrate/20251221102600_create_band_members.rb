class CreateBandMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :band_members, if_not_exists: true do |t|
      t.references :band, null: false, foreign_key: true
      t.string :name
      t.integer :no_of_members
      t.string :instrument

      t.timestamps
    end
  end
end
