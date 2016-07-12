class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  protect_from_forgery with: :exception
   before_action :configure_permitted_parameters, if: :devise_controller?
   rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :tutor_id])
  end

  def after_sign_up_path_for(resource)
    user_path(current_user)
  end

  def after_sign_in_path_for(resource)
    if current_user.admin? || current_user.tutor?
      user_path(current_user)
    else
    user_path(current_user)
  end
  end

  

def user_not_authorized
  flash[:alert] = "You are not authorized to perform this action."
  redirect_to user_path(current_user)
end

end
