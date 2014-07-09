class NotificationsController < ApplicationController 
	before_action :authenticate_user!


def index
    @report_notifications = Report.find_pending
    @friend_request_notifications = Friendship.find_pending
    @prizes_notifications = Goal.find_completed
    #@length = @report_notifications.length + @friend_request_notifications.length + @prizes_notifications.length
end

end
