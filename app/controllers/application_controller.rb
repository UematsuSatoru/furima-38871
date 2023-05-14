class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  private
    def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:encrypted_password, :nickname, :last_name, :first_name, :last_kana, :first_kana, :birth_date])
    devise_parameter_sanitizer.permit(
      :login, keys: [:encrypted_password])
  end
end
