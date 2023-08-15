class ApplicationController < ActionController::Base
  after_action :update_user_online, if: :user_signed_in?

  private

  def update_user_online
  end
end
