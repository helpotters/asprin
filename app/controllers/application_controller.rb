class ApplicationController < ActionController::Base
  protected

  def authenticate_user!
    if user_signed_in?
      super
    else
      redirect_to sign_in_path, notice: 'must first sign in'
    end
  end
end
