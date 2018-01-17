require 'random_data'

#Create unique post
Question.find_or_create_by!(
    title: "Some unique Question Title",
    body: "Some unique Question Body"
)
#Create random Posts
20.times do
    # The bang operator instructs Ruby to raise an error if there's a problem with the data we're seeding
    Question.create!(
        title:  RandomData.random_sentence,
        body:   RandomData.random_paragraph
    )
end
questions = Question.all

puts "Seed finished"
puts "#{Question.count} questions created"
