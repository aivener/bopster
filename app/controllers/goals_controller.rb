class GoalsController < ApplicationController

	def index
		@goals = Goal.all
	end

	def new
		@goal = Goal.new
	end

	def create
		@goal = Goal.new(goal_params)
		@goal.save
		redirect_to :action => :index
	end

	private

	def goal_params
		params.require(:goal).permit(:title, :description, :target, :unit, :prize, :status, :kid_id, :parent_id)
	end


	#THIS NEEDS TO BE FIXED - it populates the kid_name hash so that it is full of the kid's names of that parent so they can pick from a drop down menu that lists the names of their kids (see twitter_on_rails @handles)
	# def set_kid_names
	# 	@kid_names = {}
	# 	Goal.all.each { |goal| @handles[goal.handle] = user.id }
	# end


end
