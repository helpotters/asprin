class NotificationsController < ApplicationController
  def destroy
  end

  def feed
    @notifications = Notification.where(recipient_id: current_user)
  end

  def update
  end
end
