class MaterialsController < ApplicationController
  before_action :set_material, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  # GET /materials
  # GET /materials.json
  def index
    raise SecurityTransgression unless Material.can_be_read_by? current_user
    @materials = Material.all
  end

  # GET /materials/1
  # GET /materials/1.json
  def show
    raise SecurityTransgression unless current_user.can_read? @material
  end

  # GET /materials/new
  def new
    raise SecurityTransgression unless Material.can_be_created_by? current_user
    @material = Material.new
  end

  # GET /materials/1/edit
  def edit
    raise SecurityTransgression unless current_user.can_update? @material
  end

  # POST /materials
  # POST /materials.json
  def create
    raise SecurityTransgression unless Material.can_be_created_by? current_user
    @material = Material.new(material_params)
    if @material.save
      redirect_to course_path(@material.course_id), notice: 'Material was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /materials/1
  # PATCH/PUT /materials/1.json
  def update
    raise SecurityTransgression unless current_user.can_update? @material
    if @material.update(material_params)
      redirect_to @material, notice: 'Material was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /materials/1
  # DELETE /materials/1.json
  def destroy
    raise SecurityTransgression unless current_user.can_destroy? @material
    id = @material.course_id
    @material.destroy
    redirect_to course_path(id)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_material
    @material = Material.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def material_params
    params.require(:material).permit(:title, :description, :category, :course_id)
  end
end
