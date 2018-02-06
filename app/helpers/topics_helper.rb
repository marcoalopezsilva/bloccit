module TopicsHelper

  def user_is_authorized_for_topics_cd?
    current_user && current_user.admin?
  end

  def user_is_authorized_for_topics_u?
    current_user && (current_user.moderator? || current_user.admin?)
  end

end
