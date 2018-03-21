# The FactoryGirl documentation states that it's best to keep factories in  spec/factories
# Each factory should have a dedicated file named after the object type the factory will create.

FactoryGirl.define do
  pw = RandomData.random_sentence
  #NL: Declares the name of the factory (:user)
  factory :user do
    name RandomData.random_name
    #NL: each User that the factory builds will have a unique email address using 'sequence'. This is a FactoryGirl feature.
    # Sequences can generate unique values in a specific format, for example, e-mail addresses.
    sequence(:email){|n| "user#{n}@factory.com"}
    password pw
    password_confirmation pw
    role :member
  end
end
