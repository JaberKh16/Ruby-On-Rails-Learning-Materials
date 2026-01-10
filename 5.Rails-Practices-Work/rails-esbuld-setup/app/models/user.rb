class User < ApplicationRecord
    # table name prefixing
    # self.table_name = 'app_users'

    # set the primary key
    # self.primary_key = 'user_id'

    # set callbacks
    before_save { self.email = email.downcase }
    after_create :log_new_user

    private
    def log_new_user
        Rails.logger.info "New user created: #{self.name} (#{self.email})"
    end

    # validations
    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
    

end
