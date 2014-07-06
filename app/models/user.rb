class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  has_many :goals, foreign_key: "kid_id"
  
  has_many :kids, class_name: "User", foreign_key: "parent_id"
  belongs_to :parent, class_name: "User"

  after_create :send_welcome_email

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	def self.filter(query)
		query.blank? ? User.all : User.where("name || username LIKE '%#{query}%'")
	end

  protected

  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end

end
