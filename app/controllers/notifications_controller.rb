class NotificationsController < ApplicationController
  def destroy
  end

  def feed
    @notifications = Notification.where(recipient_id: current_user)
    respond_to do |format|
      format.html
    end
  end

  def update
  end
end
