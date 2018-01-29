class PostsController < ApplicationController

  #posts.index is no longer needed because they are shown nested to topics
  #def index
      # We declare an instance variable (called '@posts') and assign it a collection of Post object using the 'all' method provided by 'ActiveRecord'
      # 'all' returns a collection of Post objects
      #@posts = Post.all
  #end

  def show
        @post = Post.find(params[:id])
  end

  def new
      @topic = Topic.find(params[:topic_id])
      @post = Post.new
  end

  def create
      # We call Post.new to create a new instance of Post
      @post = Post.new
      @post.title = params[:post][:title]
      @post.body = params[:post][:body]
      @topic = Topic.find(params[:topic_id])
      @post.topic = @topic
      if @post.save
          # The flash hash provides a way to pass temporary values between actions. Any value placed in flash will be available in the next action and then deleted
          flash[:notice] = "Post was saved."
          # Redirecting to @post will direct the user to the posts 'show' view
          redirect_to [@topic, @post]
      else
          flash.now[:alert] = "There was an error saving the post. Please try again"
          render :new
      end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
      @post = Post.find(params[:id])
      @post.title = params[:post][:title]
      @post.body = params[:post][:body]
      if @post.save
          flash[:notice] = "Post was updated."
          redirect_to [@post.topic, @post]
      else
          flash.now[:alert] = "There was an error updating the post. Please try again."
      render :edit
      end
  end

  def destroy
      @post = Post.find(params[:id])
      if @post.destroy
          flash[:notice] = "\"#{@post.title}\" was deleted successfully."
          redirect_to @post.topic
      else
          flash.now[:alert] = "There was an error deleting the post."
          render :show
      end
  end
end
