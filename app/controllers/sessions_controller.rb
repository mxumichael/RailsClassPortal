class SessionsController < ApplicationController
  def new
  end

  def create
    student = Student.find_by(email: params[:session][:email].downcase)
    if student #&& student.authenticate(params[:session][:password])
      log_in student
      redirect_to student
    else
      instructor = Instructor.find_by(email: params[:session][:email].downcase)
      if instructor #&& instructor.authenticate(params[:session][:password])
        log_in instructor
        redirect_to instructor
      else
        admin = Admin.find_by(email: params[:session][:email].downcase)
        if admin #&& admin.authenticate(params[:session][:password])
          log_in admin
          redirect_to admin
        else
          flash.now[:danger] = 'Invalid email/password combination'
          render 'new'
        end
      end
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
