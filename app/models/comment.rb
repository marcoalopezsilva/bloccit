class Comment < ApplicationRecord
    #NL: "A comment belongs to a post" o "a post has many comments"
    belongs_to :post
end
