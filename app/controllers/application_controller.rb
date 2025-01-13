class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
before_action :authenticate_user!
  before_action :check_role


def check_role
    if user_signed_in? && current_user.role.nil?
      redirect_to set_role_path # Define a new route and action for role selection
    end
  end
  

  
end
