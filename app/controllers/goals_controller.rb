class GoalsController < ApplicationController
	before_action :authenticate_user!
	#before_create :authenticate_parent!

	def index
		@goals = Goal.all
		@report = Report.new
	end

	def new
		@goal = Goal.new
		@kid_names = current_user.kids.pluck(:name, :id)
	end

	def edit
		@goal = Goal.find(params[:id])
		@kid_names = current_user.kids.pluck(:name, :id)
	end

	def create
		@goal = Goal.new(goal_params)
		@goal.progress = 0
		@goal.status = 0
		@goal.prize_status = -1
		@goal.save
		redirect_to :action => :index
	end

	def update
		@goal = Goal.find(params[:id])
		@goal.update!(goal_params)
		@goal.save
		redirect_to goals_path
	end

	def destroy
		@goal.delete
	end

	def received_prize
		@goal = Goal.find(params[:goal_id])
		@goal.update_attributes(prize_status: 1)
		redirect_to '/notifications'
	end

	private

	def goal_params
		params.require(:goal).permit(:title, :description, :target, :unit, :prize, :status, :kid_id)
	end

end
