# require bcrypt for password hashing
# require 'bcrypt'

class User < ApplicationRecord
    # because of using bcrypt gem rails provides password hashing methods
    # via has_secure_password which provides password and password_confirmation attributes
    # where dont need to manually handle password hashing but it will be done automatically
    # using password_digest column in the database which needs to be present in users table
    has_secure_password  # adds methods to set and authenticate against a BCrypt password.



    # default setup for is_active and age
    after_initialize :set_defaults, if: :new_record?

 

    # validation rules
    validates :first_name, presence: true, length: {minimum:1, maximum:10}, format: {
              with: /\A[a-zA-Z0-9_]+\z/,
              message: "only allows letters, numbers, and underscores",
            }, uniqueness: { case_sensitive: false }

    validates :last_name, presence:true, length: { minimum: 1, maximum: 10 }, format: {
        with: /\A[a-zA-Z0-9_]+\z/,
        message: "only allows letters, numbers, and underscores",
    }, uniqueness: { case_sensitive: false }
    validates :email, presence: true, uniqueness: true
    validates :age, presence: false,
                    numericality: { only_integer: true, greater_than_or_equal_to: 13 }, allow_nil: true

    # Password validations by Rails + custom strength
    validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
    
    # confirm password presence
    validates :password_confirmation,
            presence: true,
            if: -> { new_record? || !password.nil? }

    # Boolean validation: must be true or false
    validates :is_active, inclusion: { in: [true, false] }


    # method to get full name
    def full_name
        "#{first_name} #{last_name}".strip
    end


    private
    def password_required?
        password_digest.blank? || !password.nil?
    end

    # method to set defaults
    private
    def set_defaults
        self.is_active = true if is_active.nil?
        self.age = nil if age.nil?
    end

    # # setter for password
    # def password=(new_password)
    #     self.password_hash = Password.create(new_password)
    # end

    # # authenticate user with password
    # def authenticate(password)
    #     Password.new(self.password_hash) == password
    # end

    


end
