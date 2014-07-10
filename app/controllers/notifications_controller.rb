class NotificationsController < ApplicationController 
	before_action :auth_user!


def index
    @report_notifications = Report.find_pending
    @friend_request_notifications = Friendship.find_pending
    @prizes_notifications = Goal.find_completed
end

end
