class EmployeesController < ApplicationController
  before_action :set_employee, only: [:edit, :update, :show, :destroy]
  def index
  @q = Employee.ransack(params[:q])
  @employees = @q.result(distinct: true).order(:first_name)
end


  
def new 
    @employee =  Employee.new
  end

  def create 
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to @employee, notice: "Employee successfully added!"
    else 
      render :new
  end
end

def update 
    if @employee.update(employee_params)
      redirect_to @employee, notice: "Employee successfully Updated!"
    else 
      render :edit
  end
 end

 def destroy
  if @employee.destroy
      redirect_to employees_path, notice: "Employee successfully deleted!"
  end
 end


private 
    def employee_params
      params.require(:employee).permit(:first_name,
       :last_name, :email, :department, :position, :hired_on, :salary, :image)
    end

    def set_employee
      @employee = Employee.find(params[:id])
    rescue ActiveRecord::RecordNotFound => error
      redirect_to employees_path, notice: error
    end
  end

