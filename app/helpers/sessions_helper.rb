module SessionsHelper

  #logs in the given user
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= Student.find_by(id: session[:user_id]) || Instructor.find_by(id: session[:user_id]) || Admin.find_by(id: session[:user_id])
  end

  #returns true if the user is logged in, false otherwise
  def logged_in?
    !current_user.nil?
  end

  #logs out the current user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end