class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private #Why is this private?
  def current_user
    User.find( session[:user_id] ) if session[:user_id]
  end
  def current_manager
    Manager.find( session[:manager_id] ) if session[:manager_id]
  end
  helper_method :current_user, :current_manager
end
