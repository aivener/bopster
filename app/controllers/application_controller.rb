class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :notification_counter

  
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

  def notification_counter
    @length = 0
    @report_notifications = Report.find_pending
    @friend_request_notifications = Friendship.find_pending
    @prizes_notifications = Goal.find_completed
    if user_signed_in?
      @report_notifications.each do |notif|
        if User.find(Goal.find(notif.goal_id).kid_id).parent_id == current_user.id
          @length += 1
        end
      end
      @friend_request_notifications.each do |notif|
        if (User.find(notif.receiver_id).id == current_user.id) || (User.find(notif.requester_id).id == current_user.id)
          @length += 1
        end
      end
      @prizes_notifications.each do |notif|
        if (User.find(notif.kid_id).id == current_user.id) || (User.find(notif.kid_id).parent_id == current_user.id)
          @length += 1
        end
      end
    end
    @length
    #@length = @report_notifications.length + @friend_request_notifications.length + @prizes_notifications.length
  end

end
