class PostsController < ApplicationController
  def index
      # We declare an instance variable (called '@posts') and assign it a collection of Post object using the 'all' method provided by 'ActiveRecord'
      # 'all' returns a collection of Post objects
      @posts = Post.all
  end

  def show
        @post = Post.find(params[:id])
  end

  def new
      @post = Post.new
  end

  def create
      # We call Post.new to create a new instance of Post
      @post = Post.new
      @post.title = params[:post][:title]
      @post.body = params[:post][:body]
      if @post.save
          # The flash hash provides a way to pass temporary values between actions. Any value placed in flash will be available in the next action and then deleted
          flash[:notice] = "Post was saved."
          # Redirecting to @post will direct the user to the posts 'show' view
          redirect_to @post
      else
          flash.now[:alert] = "There was an error saving the post. Please try again"
          render :new
      end
  end

  def edit
  end
end
