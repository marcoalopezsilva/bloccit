class PostsController < ApplicationController

  before_action :require_sign_in, except: :show
  before_action :authorize_user_update, only: [:update]
  before_action :authorize_user_create, only: [:new, :create]
  before_action :authorize_user_delete, only: [:destroy]

  def show
        @post = Post.find(params[:id])
  end

  def new
      @topic = Topic.find(params[:topic_id])
      @post = Post.new
  end

  def create
      @topic = Topic.find(params[:topic_id])
      @post = @topic.posts.build(post_params)
      @post.user = current_user

      if @post.save
          flash[:notice] = "Post was saved."
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
      @post.assign_attributes(post_params)
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

  private

    def post_params
      params.require(:post).permit(:title, :body)
    end

    def authorize_user_update
      post = Post.find(params[:id])
      unless current_user == post.user || current_user.admin? || current_user.moderator?
        flash[:alert] = "You are not authorized to do that!"
        redirect_to [post.topic, post]
      end
    end

    def authorize_user_create
      unless current_user.admin? || current_user.moderator? || current_user.member?
        flash[:alert] = "You are not authorized to do that!"
        redirect_to [post.topic, post]
      end
    end

    def authorize_user_delete
      post = Post.find(params[:id])
      unless current_user.admin? || current_user == post.user
        flash[:alert] = "You are not authorized to do that!"
        redirect_to [post.topic, post]
      end
    end

end
