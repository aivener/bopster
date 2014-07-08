class Goal < ActiveRecord::Base
	belongs_to :parent, :class_name => 'User'
	belongs_to :kid, :class_name => 'User'

	has_many :reports, :dependent => :destroy

	def self.find_completed
		Goal.where(prize_status: 0)
	end
end