#When we use Rails to create a Model, the new class inherits from ApplicationRecord by default
# ApplicationRecord essentially handles interaction with the database and allows us to persist data through our class
class Post < ApplicationRecord
    # In next line, 'dependent: destroy' does a cascade delete
    belongs_to :topic
    belongs_to :user
    has_many :comments, dependent: :destroy

    # The default_scope will order all posts by their created_at date, in descending order
    default_scope { order('created_at DESC') }
    scope: ordered_by_title, -> { order('title DESC') }
    scope: ordered_by_reverse_created_at, -> { order('created_at ASC') }

    validates :title, length: {minimum: 5}, presence: true
    validates :body, length: {minimum: 20}, presence: true
    validates :topic, presence: true
    validates :user, presence: true

end
