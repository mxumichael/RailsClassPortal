class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    raise SecurityTransgression unless User.can_be_read_by? current_user
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    raise SecurityTransgression unless current_user.can_read?(@user)
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    raise SecurityTransgression unless current_user.can_update?(@user)
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      unless logged_in?
        log_in @user
      end
      redirect_to welcome_index_path, notice: 'User was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    raise SecurityTransgression unless current_user.can_update?(@user)
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    raise SecurityTransgression unless current_user.can_destroy?(@user)
    if !(@user.email == 'admin@admin.com') || !(current_user == @user)
      @user.destroy
      redirect_to users_path(role: params[:role].to_s.downcase)
    else
      redirect_to users_path, notice: 'Unable to destroy user'
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :type)
  end

  def enroll
    @user = User.find(t.session)
    @course = Course.find
  end
end
