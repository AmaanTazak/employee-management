class HomesController < ApplicationController
  def index
    @q = Employee.ransack(params[:q])
    @employees = @q.result(distinct: true).order(:first_name)
    @employee = Employee.all
  end
end
