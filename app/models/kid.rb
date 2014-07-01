class Kid < ActiveRecord::Base
	belongs_to :parent
	has_many :goals
end