class Goal < ActiveRecord::Base
	#belongs_to :parent
	#belongs_to :kid

	has_many :reports
end