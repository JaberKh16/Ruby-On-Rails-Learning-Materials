class ReplacePublishedAtWithPublishedYearInBooks < ActiveRecord::Migration[8.1]
  def change
    remove_column :books, :published_at, :datetime
    add_column :books, :published_year, :integer
  end
end
