module SessionsHelper

  def create_session(user)
    # 'session' is an object Rails provides to track the state of a particular user
    # There is a 1:1 relationship between session objects and user ids
    # When the user closes the app, the 'session' object is automatically destroyed
    session[:user_id] = user.id
  end

  def destroy_session(user)
    # We clear the user id on the session object by setting it to nil, which effectively destroys the user session because we can't track it via their user id any longer.
    session[:user_id] = nil
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

end
