# frozen_string_literal: true

# Notification is a polymorphic model that references related components to appear in the notification dropdown.
# Change to use polymorphic slot settings.
class NotificationComponent < ApplicationComponent
  DEFAULT_TYPE = "Info"

  NOTIF_TYPES = [DEFAULT_TYPE, "FriendRequest"].freeze

  attr_accessor :notif, :payload

  def initialize(notification:, type: DEFAULT_TYPE)
    @payload = notification.notifiable
    @notif_type = fetch_or_fallback(NOTIF_TYPES, notification.notifiable_type, DEFAULT_TYPE)
  end

  def call
    content_tag(:"turbo-frame", class: "flex w-full rounded-lg shadow-lg p-1", id: "notif_#{@payload.id}") do
      set_notif_type(@notif_type)
    end
  end

  private

  def set_notif_type(type)
    case type
    when "Info"
    when "FriendRequest" then render_friend_request
    end
  end

  def render_friend_request
    render FriendRequestComponent.new friend_request: @payload do |component|
      component.with_avatar
    end
  end
end
