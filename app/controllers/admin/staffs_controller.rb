class Admin::StaffsController < ApplicationController
  layout "application_admin"
  load_and_authorize_resource

  before_action :authenticate_staff!
  before_action :load_position_staff, only: [:new, :edit]

  def index
    @staffs = Staff.sort_by_create_at.paginate page: params[:page]
  end

  def new
  end

  def create
    @staff = Staff.new staff_params
    if @staff.save
      flash[:success] = t "controllers.admins.staff.create_staff"
      redirect_to admin_staffs_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @staff.update_attributes staff_params
      redirect_to admin_staffs_path
      flash[:success] = t "controllers.admins.staff.update_staff"
    else
      render :edit
    end
  end

  def destroy
    if @staff.destroy
      flash[:success] = t "controllers.admins.staff.delete_staff"
      respond_to do |format|
        format.html
        format.js
      end
    else
      flash[:danger] = t "controllers.admins.staff.wrong_staff"
    end
    redirect_to admin_staffs_path 
  end

  private
  def staff_params
    params.require(:staff).permit :name, :email, :password,
      :password_confirmation, :position
  end

  def load_position_staff
  	@position = Staff.positions.keys
  end
end
