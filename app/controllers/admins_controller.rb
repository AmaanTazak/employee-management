class AdminsController < ApplicationController
  before_action :authorize_admin

  def index
    @admins = User.where(role: 'admin')
  end

  def new
    @admin = User.new
  end

 def destroy
    @admin = User.find(params[:id]) # Find the admin by ID
    if @admin.destroy
      redirect_to admins_path, notice: 'Admin deleted successfully.'
    else
      redirect_to admins_path, alert: 'Failed to delete admin.'
    end
  end
  
  def create
    @admin = User.new(admin_params)
    @admin.role = 'admin' # Set the role explicitly to admin
    if @admin.save
      redirect_to admins_path, notice: 'Admin created successfully.'
    else
      render :new, alert: 'Error creating admin.'
    end
  end

  private

  def admin_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def authorize_admin
    redirect_to root_path, alert: 'Access denied!' unless current_user.admin?
  end
end
