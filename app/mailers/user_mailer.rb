class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
  	@user = user
  	mail(to: @user.email, subject: "Welcome to Kazoo!")	
  end

  def goal_completed_email(user)
  	@user = user
  	mail(to: @user.email, subject: "Your Child has Competed a Goal!")
  end

end
