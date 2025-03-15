module ApplicationHelper

  def current_user
    User.find(session[:user_id]) if is_logged_in?
  end

  def is_logged_in?
    session[:user_id] != nil
  end
end
