class Archive < ApplicationRecord
  belongs_to :book

  validates :name, presence: true

  validates :book_id,
            presence: true,
            numericality: { only_integer: true }

  validates :archive_type,
            presence: true,
            length: { minimum: 3, maximum: 30 }

  validates :archive_date,
            presence: true
end
