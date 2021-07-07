class ApplicationController < ActionController::Base

  helper_method :current_user,
                :logged_in?,
                :flash_message

  private
  def authenticate_user!
   unless current_user
    cookies[:controller] = params["controller"]
    cookies[:action] = params["action"]
    redirect_to login_path, alert: 'Please Login!'
   end

  #  cookie_set_email(current_user)
   cookies[:email] = current_user&.email
   
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
