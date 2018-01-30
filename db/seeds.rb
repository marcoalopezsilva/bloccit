require 'random_data'

# Create random Topics
15.times do
    # The bang operator instructs Ruby to raise an error if there's a problem with the data we're seeding
  Topic.create!(
    name:         RandomData.random_sentence,
    description:  RandomData.random_paragraph
  )
end
topics = Topic.all

# Create random Posts
50.times do
  Post.create!(
    topic:  topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end

posts = Post.all

# Create random Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

# Create random Sponsored posts
25.times do
    SponsoredPost.create!(
            topic: topics.sample,
            title: RandomData.random_sentence,
            body: RandomData.random_paragraph,
            price: rand(100...1)
    )
end

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{SponsoredPost.count} sponsored posts created"
