# frozen_string_literal: true
# app/components/notification_component.rb
class NotificationComponent < ViewComponent::Base
  def initialize(notification:)
    @notif_type = notification.notifiable_type
    @notif = notification.notifiable
  end

  def call
    content_tag(:"turbo-frame", class: "flex w-full rounded-lg shadow-lg p-1", id: "notif_#{@notif.id}" ) do
      render_notification_type
    end
  end

  private

  def render_notification_type
    case @notif_type
    when "FriendRequest"
      render_friend_request
    end
  end

  def render_friend_request
    render FriendRequestComponent.new friend_request: @notif
  end
end
