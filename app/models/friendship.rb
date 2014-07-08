class Friendship < ActiveRecord::Base
	belongs_to :user
	
	def self.find_pending
		Friendship.where(status: "pending")
	end

end