#When we use Rails to create a Model, the new class inherits from ApplicationRecord by default
# ApplicationRecord essentially handles interaction with the database and allows us to persist data through our class
class Post < ApplicationRecord
    # In next line, 'dependent: destroy' does a cascade delete
    belongs_to :topic
    belongs_to :user
    has_many :comments, dependent: :destroy
    # We can see how many votes have been cast on a post by calling post.votes, thanks to the has_many :votes declaration in Post.
    has_many :votes, dependent: :destroy
    has_many :favorites, dependent: :destroy

    # The default_scope will order all posts by their created_at date, in descending order
    default_scope { order('rank DESC') }
    #NL: If the user is present, we return all posts. If not, we use the Active Record joins method to retrieve all posts which belong to a public topic.
    scope :visible_to, -> (user) { user ? all : joins(:topic).where('topics.public' => true) }

    validates :title, length: {minimum: 5}, presence: true
    validates :body, length: {minimum: 20}, presence: true
    validates :topic, presence: true
    validates :user, presence: true

    def up_votes
      #Here we could have written 'self.votes'
      #This fetches a collection of votes with a value of 1. We then call count on the collection to get a total of all up votes.
      votes.where(value: 1).count
    end

    def down_votes
      votes.where(value: -1).count
    end

    def points
      votes.sum(:value)
    end

    def update_rank
     age_in_days = (created_at - Time.new(1970,1,1)) / 1.day.seconds
     new_rank = points + age_in_days
     update_attribute(:rank, new_rank)
   end

end
