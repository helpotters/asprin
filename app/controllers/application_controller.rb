class ApplicationController < ActionController::Base
  after_action :update_user_online, if: :user_signed_in?
  before_action :configure_sign_up_params, if: :devise_controller?

  private

  def update_user_online
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
  end
end
