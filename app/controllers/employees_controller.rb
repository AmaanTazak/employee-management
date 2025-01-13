class EmployeesController < ApplicationController
  before_action :require_admin, only: [:new, :create, :edit, :update, :destroy, :index]
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  def index
    @q = Employee.ransack(params[:q])
    @employees = @q.result(distinct: true).order(:first_name)
  end

  def show
    # @employee is already set by the set_employee method
  end

  def new 
    @employee = Employee.new
  end

  def create 
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to @employee, notice: "Employee successfully added!"
    else 
      render :new
    end
  end

  def edit
    # @employee is already set by the set_employee method
  end

  def update 
    if @employee.update(employee_params)
      redirect_to @employee, notice: "Employee successfully updated!"
    else 
      render :edit
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_path, notice: "Employee successfully deleted!"
  end

  private 

  def set_employee
    @employee = Employee.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to employees_path, alert: "Employee not found."
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :department, :position, :hired_on, :salary, :image)
  end

  def require_admin
    redirect_to root_path, alert: 'Access denied!' unless current_user.admin?
  end
end
