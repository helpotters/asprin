class ApplicationController < ActionController::Base
  after_action :update_user_online, if: :user_signed_in?
  before_action :set_results

  private

  def set_results
    @results = []
  end
  def update_user_online
  end
end
