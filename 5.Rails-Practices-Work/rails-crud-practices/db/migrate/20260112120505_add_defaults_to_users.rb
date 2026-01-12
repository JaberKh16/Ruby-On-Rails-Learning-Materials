class AddDefaultsToUsers < ActiveRecord::Migration[8.1]
  def change
    change_column_default :users, :is_active, from: nil, to: true
    change_column_default :users, :age, from: nil, to: nil
  end
end
