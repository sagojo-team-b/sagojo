class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :set_profile
  # before_action :authenticate_user!


  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :magazine, :email, :password, :password_confirmation, :remember_me, :convention) }
      devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:login, :name, :email, :password, :remember_me) }
      devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password) }
    end

    def set_profile
      @profile = current_user.profile if user_signed_in?
    end
end
