class Book < ApplicationRecord
  # Title
  validates :title,
            presence: true,
            length: { minimum: 3, maximum: 30 }

  # ISBN
  validates :isbn,
            presence: true,
            length: { minimum: 3, maximum: 30 }

  # Author
  validates :author,
            presence: true,
            length: { minimum: 3, maximum: 30 }

  # Price
  validates :price,
            presence: true,
            numericality: { greater_than: 0 }

  # Description (optional)
  validates :description,
            length: { minimum: 10, maximum: 200 },
            allow_blank: true

  # Published year
  validates :published_year,
            presence: true,
            numericality: {
              only_integer: true,
              greater_than_or_equal_to: 1900,
              less_than_or_equal_to: Time.current.year
            }
end
