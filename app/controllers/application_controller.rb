class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

private
  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:birth_date, :first_name, :email, :password, :password_confirmation) }
   devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:birth_date, :first_name, :email, :password) }
 end

 def after_sign_in_path_for(resource)
    posts_path(resource)
 end
end
