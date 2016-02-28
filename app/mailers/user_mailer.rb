class UserMailer < ActionMailer::Base
  default from: "RailsClassPortal@ncsu.edu"
  def email_active_status(users, course)
    users.each do |user|
      @course = course
      @user = user
      @url  = 'http://54.191.201.61:3000/'
      mail(to: @user[:email], subject: 'Welcome to My Awesome Site')
    end
  end
end
