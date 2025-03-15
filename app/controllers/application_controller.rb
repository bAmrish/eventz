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

  def current_user_admin?
    return current_user && current_user.admin?
  end

  def require_signin
    unless is_logged_in?
      session[:intended_url] = request.url
      redirect_to login_path, notice: 'You need to be logged in!'
    end
  end

  def require_admin
    unless current_user_admin?
      redirect_to root_url, alert: "Unauthorized!"
    end
  end

  helper_method :current_user, :is_logged_in?, :is_current_user?, :current_user_admin?
end
