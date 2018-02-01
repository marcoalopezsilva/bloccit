class User < ApplicationRecord
  # Callbacks are hooks into the life cycle of an Active Record object that allow you to trigger logic before or after an alteration of the object state.
  #  User is requesting that the database execute { self.email = email.downcase }
  before_save { self.email = email.downcase if email.present? }

  validates :name, length: { minimum: 1, maximum: 100}, presence: true

  # First validation runs only if password_digest is nil. This ensures that when we create a new user, they have a valid password.
  validates :password, presence: true, length: {minimum: 6}, if: "password_digest.nil?"
  # Ensures that when updating a user's password, the updated password is also six characters long. allow_blank: true skips the validation if no updated password is given. This allows us to change other attributes on a user without being forced to set the password.
  validates :password, length: {minimum: 6}, allow_blank: true

  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false},
            length: { minimum: 3, maximum: 254}

  # has_secure_password "adds methods to set and authenticate against a BCrypt password. This mechanism requires you to have a password_digest attribute"
  # has_secure_password creates two virtual attributes, password and  password_confirmation that we use to set and save the password.
  # To use has_secure_password, we need to install BCrypt
  has_secure_password

end
