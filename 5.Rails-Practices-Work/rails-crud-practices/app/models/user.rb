class User < ApplicationRecord
    has_many: user

    # validate user
    # validates :first_name, presence: true, length: {minimum:1, maximum:10}, format: {
    #           with: /\A[a-zA-Z0-9_]+\z/,
    #           message: "only allows letters, numbers, and underscores",
    #         }, uniqueness: { case_sensitive: false }

    # validates :last_name, presence:true, length: { minimum: 1, maximum: 10 }, format: {
    #     with: /\A[a-zA-Z0-9_]+\z/,
    #     message: "only allows letters, numbers, and underscores",
    # }, uniqueness: { case_sensitive: false }

    # validates :age , presence: true, length: { minimum:1, maximum: 3 },
    

end
