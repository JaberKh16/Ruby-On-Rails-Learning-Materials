class User < ApplicationRecord
  # include JTIMatcher
  include Devise::JWT::RevocationStrategies::JTIMatcher

  # including regex validation
  include RegexValidations


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  # Or if using has_secure_password
  # has_secure_password



        
  # to restrict the request without password
  # validates :password_confirmation, presence: true, on: %i[create update]


  # validate properties
  validates :first_name, presence: true, length: { maximum: 50 }, format: { with: VALID_NAME_REGEX }
  validates :last_name, presence: true, length: { maximum: 50 }, format: { with: VALID_NAME_REGEX }
  validates :user_name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }
  # validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 }, format: { with: ConstantData::VALID_EMAIL_REGEX }
  # validates :nid, presence: true, uniqueness: true, format: { with: /\A[\w\d]+\z/, message: "is invalid" }
  validates :password, presence: true, length: { minimum: 6 }, confirmation: true, on: :create
  # Optional: Custom validation for NID format (e.g., specific length)
  validate :nid_length, if: -> { nid.present? }

  def nid_length
    # Example: NID should be exactly 10 digits
    unless nid.match?(/\A\d{10}\z/)
      errors.add(:nid, "must be exactly 10 digits")
    end
  end

end
