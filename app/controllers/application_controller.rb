class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    # before_action :check_admin, only: [:new, :create, :edit, :update, :destroy]
  
    private
  
    def check_admin
      unless current_user&.admin?
        redirect_to root_path, alert: "Access denied. Admins only."
      end
    end
  end
  