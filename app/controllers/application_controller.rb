class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :notification_counter

  
  protect_from_forgery with: :exception

  def stored_location_for(resource)
    nil
  end

  def after_sign_in_path_for(resource)
    goals_path
  end

  def auth_user!
    redirect_to root_path unless user_signed_in?
  end

  def authenticate_kid!
  	unless (user_signed_in? && current_user.role == "kid")
  		flash[:alert] = "Only kids can do that!"
  		redirect_to root_path
  	end
  end

  def authenticate_parent!
  	unless (user_signed_in? && current_user.role == "parent")
  		flash[:alert] = "Only parents can do that!"
  		redirect_to root_path
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
        if notif.goal_id
          if User.find(Goal.find(notif.goal_id).kid_id).parent_id == current_user.id
            @length += 1
          end
        end
      end
      @friend_request_notifications.each do |notif|
        if (notif.receiver_id || notif.requester_id)
          if (User.find(notif.receiver_id).id == current_user.id) || (User.find(notif.requester_id).id == current_user.id)
            @length += 1
          end
        end
      end
      @prizes_notifications.each do |notif|
        if notif.kid_id
          if (User.find(notif.kid_id).id == current_user.id) || (User.find(notif.kid_id).parent_id == current_user.id)
            @length += 1
          end
        end
      end
    end
    @length
  end

end
