class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
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

end
