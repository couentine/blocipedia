class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  protect_from_forgery
  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  
  
  protected

    def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
     devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    end
  
  
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
  
