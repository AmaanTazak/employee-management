class AttendancesController < ApplicationController
  before_action :set_employee, only: [:index, :new, :create]

  def index
    @attendances = @employee.attendances.order(date: :asc)
  end

  def new
    @attendance = @employee.attendances.new
  end

  def create
    @attendance = @employee.attendances.new(attendance_params)
    if @attendance.save
      flash[:success] = "Attendance recorded successfully."
      redirect_to employee_attendances_path(@employee)
    else
      flash[:error] = "Failed to record attendance."
      render :new
    end
  end

  private

  def set_employee
    @employee = Employee.find(params[:employee_id])
  end

  def attendance_params
    params.require(:attendance).permit(:check_in, :check_out, :date, :status)
  end
end
