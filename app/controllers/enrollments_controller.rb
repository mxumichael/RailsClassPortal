class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  # GET /enrollments
  # GET /enrollments.json
  def index
    raise SecurityTransgression unless Enrollment.can_be_read_by? current_user
    @enrollments = Enrollment.all
  end

  # GET /enrollments/1
  # GET /enrollments/1.json
  def show
    raise SecurityTransgression unless current_user.can_read? @enrollment
  end

  # GET /enrollments/new
  def new
    raise SecurityTransgression unless Enrollment.can_be_created_by? current_user
    @enrollment = Enrollment.new

  end

  # GET /enrollments/1/edit
  def edit
    raise SecurityTransgression unless current_user.can_update? @enrollment
  end

  # POST /enrollments
  # POST /enrollments.json
  def create
    raise SecurityTransgression unless Enrollment.can_be_created_by? current_user
    @enrollment = Enrollment.new(enrollment_params)

    if @enrollment.save
      redirect_to welcome_index_path, notice: 'Enrollment was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /enrollments/1
  # PATCH/PUT /enrollments/1.json
  def update
    raise SecurityTransgression unless current_user.can_update? @enrollment
    if @enrollment.update(enrollment_params)
      redirect_to course_path(@enrollment.course_id), notice: 'Enrollment was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /enrollments/1
  # DELETE /enrollments/1.json
  def destroy
    raise SecurityTransgression unless current_user.can_destroy? @enrollment
    course_id = @enrollment.course_id
    @enrollment.destroy
    if current_user.is_a? Student
      redirect_to user_path(current_user)
    else
      redirect_to course_path(course_id)
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_enrollment
    @enrollment = Enrollment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def enrollment_params
    params.require(:enrollment).permit(:user_id, :course_id, :approve, :deny, :grade)

  end
end
