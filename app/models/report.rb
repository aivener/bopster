class Report < ActiveRecord::Base
	belongs_to :goal
	belongs_to :kid
end