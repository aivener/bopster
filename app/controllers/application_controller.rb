class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  def authenticate_kid!
  	unless (user_signed_in? && current_user.role == "kid")
  		flash[:alert] = "Only kids can do that!"
  		redirect_to :back
  	end
  end

  def authenticate_parent!
  	unless (user_signed_in? && current_user.role == "parent")
  		flash[:alert] = "Only parents can do that!"
  		#redirect_to :back
  	end
  end

    def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :role
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:sign_up) << :name
    #devise_parameter_sanitizer.for(:account_update) << :handle
  end

end
