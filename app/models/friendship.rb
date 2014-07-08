class Friendship < ActiveRecord::Base
	belongs_to :receiver, class_name: "User"
	belongs_to :requester, class_name: "User"

	
	def self.find_pending
		Friendship.where(status: "Pending")
	end

end