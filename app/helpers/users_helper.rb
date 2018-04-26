module UsersHelper

  def user_has_posts_or_comments?(user)
    if user.posts.count > 0 || user.comments.count > 0
      return true
    else
      return false
    end
  end

end
