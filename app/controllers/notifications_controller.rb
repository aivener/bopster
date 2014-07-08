class NotificationsController < ApplicationController 

def index
	@report_notifications = Report.find_pending
end

end
