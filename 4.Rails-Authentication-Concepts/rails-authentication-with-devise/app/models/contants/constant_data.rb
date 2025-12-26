# using constants
module ConstantData
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  VALID_NAME_REGEX = /\A[a-zA-Z\s\-']+\z/  # Allows letters, spaces, hyphens, and apostrophes
end