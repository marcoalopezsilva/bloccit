class PostsController < ApplicationController
  def index
      # We declare an instance variable (called '@posts') and assign it a collection of Post object using the 'all' method provided by 'ActiveRecord'
      # 'all' returns a collection of Post objects
      @posts = Post.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
