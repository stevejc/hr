class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  
  private #should this be protected?
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def require_admin
    deny_access unless current_user.admin
  end
  
  def deny_access
    redirect_to signin_path
  end
  

end
