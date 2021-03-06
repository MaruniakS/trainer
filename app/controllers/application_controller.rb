class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_info, except: :devise_controller?

  def get_info
    @muscle_groups = MuscleGroup.all
    @program_types = ProgramType.all
  end

  protected
  def check_user
    redirect_to root_path , flash: {error: 'You can login only to your profile!'} if !user_signed_in?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me,  :phone_number, :avatar, roles: ['user']) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password, :phone_number, :avatar) }
  end
end
