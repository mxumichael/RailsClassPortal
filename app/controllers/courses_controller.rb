class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :require_login
  # GET /courses
  # GET /courses.json
  def index
    if current_user.instructor?
      @instructed_list = Course.where("")
    end
    @enrollment = Enrollment.new
    @courses = Course.where(
        "course_number LIKE (?) OR title LIKE (?)",
        "%#{params[:query]}%",
        "%#{params[:query]}%")
    raise SecurityTransgression unless current_user.can_read?(Course.new)
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    raise SecurityTransgression unless current_user.can_read?(Course.new)
  end

  # GET /courses/new
  def new
    @course = Course.new
    raise SecurityTransgression unless current_user.can_create?(Course.new)
  end

  # GET /courses/1/edit
  def edit
    raise SecurityTransgression unless current_user.can_update?(@course)
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)
    raise SecurityTransgression unless current_user.can_create?(@course)
    respond_to do |format|
      if @course.save
        @enrollment = Enrollment.create(course_id: @course.id, user_id: params[:instructor], approve: true, deny: false)
        format.html { redirect_to welcome_index_path, notice: 'Course was successfully created.' }
        format.json { render action: 'show', status: :created, location: @course }
      else
        format.html { render action: 'new' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if
      @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def course_params
    params.require(:course).permit(:course_number, :title, :description, :start_date, :end_date, :status, :query, :instructor)
  end
end
