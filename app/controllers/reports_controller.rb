class ReportsController < ApplicationController

	def index
		@reports = Report.all
	end

	def new
		@report = Report.new
	end

	def create
		@report = Report.new(report_params)
		@report.save
		redirect_to :action => :index
	end

	private

	def report_params
		params.require(:report).permit(:amount, :kid_id, :goal_id, :status)
	end

end