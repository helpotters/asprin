class NotificationsController < ApplicationController
  def destroy
  end

  def feed
    @notifications = Notification.where(recipient_id: current_user).limit(11)
  end

  def update
  end
end
