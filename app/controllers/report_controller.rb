class ReportController < ApplicationController

	def new
		@report = Report.new
	end

end