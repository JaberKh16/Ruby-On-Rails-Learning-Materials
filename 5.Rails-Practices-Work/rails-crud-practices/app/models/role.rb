class Role < ApplicationRecord
  # associations
  has_many :users, dependent: :nullify
end
