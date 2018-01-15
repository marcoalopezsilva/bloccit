#When we use Rails to create a Model, the new class inherits from ApplicationRecord by default
# ApplicationRecord essentially handles interaction with the database and allows us to persist data through our class
class Post < ApplicationRecord
    # In next line, 'dependent: destroy' does a cascade delete
    has_many :comments, dependent: :destroy
end
