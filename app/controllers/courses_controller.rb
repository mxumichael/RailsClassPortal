class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  # GET /courses
  # GET /courses.json
  def index
    raise SecurityTransgression unless Course.can_be_read_by? current_user
    @enrollment = Enrollment.new
    @courses = find_courses
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    raise SecurityTransgression unless current_user.can_read? @course
  end

  # GET /courses/new
  def new
    @course = Course.new
    raise SecurityTransgression unless Course.can_be_created_by? current_user
  end

  # GET /courses/1/edit
  def edit
    raise SecurityTransgression unless current_user.can_update? @course
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    raise SecurityTransgression unless current_user.can_create? @course
    if @course[:end_date] <= @course[:start_date]
      flash[:notice] = 'End date must be after start date!'
      render action: 'new'
    else
      if @course.save
        @enrollment = Enrollment.create(course_id: @course.id, user_id: params[:instructor], approve: true, deny: false)
        redirect_to welcome_index_path, notice: 'Course was successfully created.'
      else
        flash[:notice] = 'There was an unexpected error. Please report this bug.'
        render action: 'new'
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    raise SecurityTransgression unless current_user.can_update? @course
    create_dates
    if @ending <= @starting
      flash[:notice] = 'End date must be after start date!'
      render action: 'edit'
    else
    if @course[:status] == 'Inactive' and course_params[:status] == 'Active'
      UserMailer.email_active_status(enrolled_users, @course).deliver
    end
      if @course.update(course_params)
        redirect_to @course, notice: 'Course was successfully updated.'
      else
        render action: 'edit'
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    raise SecurityTransgression unless current_user.can_destroy? @course
    @course.destroy
    redirect_to courses_url
  end

  private
  def create_dates
    if course_params.has_key?('start_date(1i)')
      @starting =  DateTime.new(course_params['start_date(1i)'].to_i,
                                course_params['start_date(2i)'].to_i,
                                course_params['start_date(3i)'].to_i)
      @ending =  DateTime.new(course_params['end_date(1i)'].to_i,
                              course_params['end_date(2i)'].to_i,
                              course_params['end_date(3i)'].to_i)

    end; if course_params.has_key?('start_date')
           @starting = course_params['start_date']
           @ending = course_params['end_date']
         end
  end

  def find_courses
    Course.where(
        'course_number LIKE (?) OR title LIKE (?)',
        "%#{params[:query]}%",
        "%#{params[:query]}%")
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def course_params
    params.require(:course).permit(:course_number, :title, :description, :start_date, :end_date, :status, :query, :instructor, :request_inactive)
  end

  def enrolled_users
    @enrolled_users = []
    @course.enrollments.each do |enrollment|
      unless enrollment.deny
        user = User.find_by(id: enrollment.user_id)
        if user.student?
        @enrolled_users.push(user)
        end
      end
    end
  end
end
