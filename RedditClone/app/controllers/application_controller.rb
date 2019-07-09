class ApplicationController < ActionController::Base
  helper_method :logged?, :current_user

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged?
    !!current_user
  end

  def ensure_logged
   redirect_to new_session_url unless logged?
  end

  def login(user)
    @current_user = user
    session[:session_token] = user.reset_session_token
  end

  def logout
    current_user.reset_session_token
    @current_user = nil
    session[:session_token] = nil
  end
end
