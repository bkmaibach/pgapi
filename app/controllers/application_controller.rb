class ApplicationController < ActionController::Base

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      redirect_to login_path, notice: 'You must log in for this'
    end
  end

  helper_method :current_user
  helper_method :logged_in?
end
