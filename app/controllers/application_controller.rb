class ApplicationController < ActionController::Base

private
  def current_user
    User.find(session[:user_id]) if is_logged_in?
  end

  def is_logged_in?
    session[:user_id] != nil
  end

  def is_current_user?(user)
    return current_user == user
  end

  helper_method :current_user, :is_logged_in?, :is_current_user?

  def require_signin
    unless is_logged_in?
      redirect_to login_path, notice: 'You need to be logged in!'
    end
  end
end
