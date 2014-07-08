class Report < ActiveRecord::Base
	belongs_to :goal
	after_update :goal_update #this will need to change when parent has to approve it

	belongs_to :kid, class_name: "User"

	def goal_update
		self.goal.progress += self.amount 
		self.goal.save
		if self.goal.progress >= self.goal.target
			self.goal.status = "Completed"
			self.goal.prize_status = 0	
			self.goal.save
			#UserMailer.goal_completed_email(User.find(Goal.find(self.goal).parent_id)).deliver
		end
	end

	def self.find_pending
		Report.where(status: "0")
	end

end