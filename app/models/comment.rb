class Comment < ApplicationRecord
    #NL: "A comment belongs to a post" o "a post has many comments"
    belongs_to :post
    belongs_to :user

    validates :body, length: {minimum: 5}, presence: true
    validates :user, presence: true
end
