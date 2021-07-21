class ApplicationController < ActionController::Base
  
  before_action :authenticate_user!
  helper_method :current_user,
                :logged_in?

  def after_sign_in_path_for(resource)
    if current_user.is_a?(Admin) 
      admin_tests_path
    else
      tests_path
    end
  end
  
end
