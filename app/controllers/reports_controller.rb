class ReportsController < ApplicationController
	before_action :authenticate_user!
	#before_action :authenticate_kid!

	def index
		@reports = Report.all
	end

	def new
		@report = Report.new
	end

	def create
		@report = Report.new(report_params)
		@report.save
		redirect_to report_path(@report)
	end

	def show

	end

	private

	def report_params
		params.require(:report).permit(:amount, :kid_id, :goal_id, :status)
	end

end