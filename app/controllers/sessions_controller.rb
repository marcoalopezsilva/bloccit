class SessionsController < ApplicationController

  #Sessions don't have a (proper) view

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    #NL checks that user is not nil and that the password is correct (authenticate)
    if user && user.authenticate(params[:session][:password])
      create_session(user)
      flash[:notice] = "Welcome, #{user.name}!"
      redirect_to root_path
    else
      flash.now[:alert] = "Invalid email/password combination"
      render :new
    end
  end

  def destroy
    destroy_session(current_user)
    flash[:notice] = "You've been signed out, come back soon!"
    redirect_to root_path
  end

end
