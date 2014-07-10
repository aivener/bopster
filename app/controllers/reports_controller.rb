class ReportsController < ApplicationController
	before_action :auth_user!
	#before_action :authenticate_kid!

	def index
		@reports = Report.all
	end

	def new
		@report = Report.new
	end

	def create
		@report = Report.new(report_params)
		@report.status = 0
		@report.save
		flash[:notice] = "Progress successfully submitted!"
		redirect_to goals_path
	end

	def show
		@report = Report.find(params[:id])
	end

	def update
		@report = Report.find(params[:id])
		@report.status = 1
		@report.save
		redirect_to "/notifications"
	end

	private

	def report_params
		params.require(:report).permit(:amount, :kid_id, :goal_id, :status)
	end

end