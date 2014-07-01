class Parent < ActiveRecord::Base
	has_many :kids
	has_many :goals
end