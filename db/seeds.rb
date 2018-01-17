require 'random_data'

#Create unique post
Post.find_or_create_by!(
    title: "Some unique Post Title",
    body: "Some unique Post Body"
)
#Create random Posts
50.times do
    # The bang operator instructs Ruby to raise an error if there's a problem with the data we're seeding
    Post.create!(
        title:  RandomData.random_sentence,
        body:   RandomData.random_paragraph
    )
end
posts = Post.all

#Create unique comment
Comment.find_or_create_by!(
    post:   posts.find_by(title: "Some unique Post Title"),
    body: "Some unique Comment body"
)
#Create random comments
100.times do
    Comment.create!(
        post:   posts.sample,
        body:   RandomData.random_paragraph
    )
end

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
puts "#{Post.count} post created"
puts "#{Comment.count} comments created"
puts "#{Question.count} questions created"
