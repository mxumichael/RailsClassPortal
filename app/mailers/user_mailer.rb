class UserMailer < ActionMailer::Base
  default from: "RailsClassPortal@ncsu.edu"
  def email_active_status(user, course)
      @course = course
      @user = User.find_by(id: user.user_id)
      @url  = 'http://54.191.201.61:3000/'
      mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
