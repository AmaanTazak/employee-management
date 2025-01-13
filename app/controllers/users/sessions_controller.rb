# app/controllers/users/sessions_controller.rb
class Users::SessionsController < Devise::SessionsController
  # After user logs in, show a flash message with their role
  def create
    super do |resource|
      if resource.admin?
        flash[:notice] = "You have logged in as an Admin."
      else
        flash[:notice] = "You have logged in as an Employee."
      end
    end
  end
end
