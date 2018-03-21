source 'https://rubygems.org'

 git_source(:github) do |repo_name|
   repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
   "https://github.com/#{repo_name}.git"
 end

 gem 'devise'
 
 # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
 gem 'rails', '~> 5.1.2'

 #Figaro is a gem used to mask sensitive data
 gem 'figaro', '1.0'

 # This block and the next one specify different databases for Development and Production
 group :production do
   # Use pg as the production database for Active Record. pg = Postgres
   gem 'pg'
   gem 'rails_12factor'
 end

 # #2
 group :development do
   # Use sqlite3 as the development database for Active Record. It is easy to use and appropriate for rapid testing
   gem 'sqlite3'
 end

 # Use Puma as the app server
 gem 'puma', '~> 3.0'
 # Use SCSS for stylesheets
 gem 'sass-rails', '~> 5.0'
 # Use Uglifier as compressor for JavaScript assets
 gem 'uglifier', '>= 1.3.0'

 # Use jquery as the JavaScript library
 gem 'jquery-rails'
 # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
 gem 'turbolinks', '~> 5'
 # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
 gem 'jbuilder', '~> 2.5'
 # Note: I changed the next line because otherwise it threw out an error message ->
 #gem 'thor', '0.19.1'
 gem 'thor', '0.20.0'

 group :development do
   gem 'listen', '~> 3.0.5'
   gem 'pry-rails'
 end

# This block adds rspec to the development and test groups
 group :development, :test do
     gem 'rspec-rails', '~> 3.0'
     gem 'rails-controller-testing'
     gem 'shoulda'
 end

 gem 'bootstrap-sass'

 gem 'bcrypt'
