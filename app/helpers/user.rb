helpers do
  def logged_in?
    if session["user_id"]
      return true
    else
      return false
    end
  end
  def get_current_user
    user = User.find(session["user_id"])
    user
  end
  def get_user(id)
    user = User.find(id)
    user
  end
  # end of helper
end
