class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, :after_sign_in, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :username, :birthdate, :email, :password, :remember_me)}
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email, :password, :remember_me)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :username, :birthdate, :about,  :email, :password, :current_password, :remember_me)}
  end

  def after_sign_in
    user_session["id"] = current_user.id
    cookies[:login] = { :value => current_user.email, :expires => Time.now + 2.weeks}
  end
end
