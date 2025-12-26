# using regex validations
module RegexValidations
  extend ActiveSupport::Concern
  
  included do
    const_set(:VALID_EMAIL_REGEX, /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i)
    const_set(:VALID_NAME_REGEX, /\A[a-zA-Z\s\-']+\z/)
  end
end