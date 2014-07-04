class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :goals, :foreign_key => :kid_id

  has_many :kids, class_name: "User",
                          foreign_key: "kid_id"
 
  belongs_to :parent, class_name: "User"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	def self.filter(query)
		query.blank? ? User.all : User.where("name LIKE '%#{query}%'")
	end
end
