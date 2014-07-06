class Report < ActiveRecord::Base
	belongs_to :goal
	after_create :goal_update #this will need to change when parent has to approve it

	belongs_to :kid, class_name: "User"

	def goal_update
		self.goal.progress += self.amount 
		self.goal.save
		if self.goal.progress >= self.goal.target
			self.goal.status = "Completed"	
			self.goal.save
			#UserMailer.goal_completed_email(User.find(Goal.find(self.goal).parent_id)).deliver
		end
	end

end