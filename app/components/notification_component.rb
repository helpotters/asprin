# frozen_string_literal: true
# app/components/notification_component.rb
class NotificationComponent < ViewComponent::Base
  include HeroiconHelper
  def initialize(notification:)
    @notif_type = notification.notifiable_type
    @notif = notification.notifiable
  end

  def call
    content_tag(:"turbo-frame", class: "flex-1 max-w-sm w-full rounded-lg shadow-lg p-1", id: "notif_#{@notif.id}" ) do
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
    content_tag(:div, class: "flex items-start w-full p-1") do
      content_tag(:div, class: "flex-shrink-0") do
        render AvatarComponent.new user: @notif.user, size: "8"
      end +
      content_tag(:div, class: "ml-3 w-0 flex flex-col flex-grow text-left items-start") do
        content_tag(:p, @notif.user.full_name, class: 'text-sm font-medium text-gray-900') +
        content_tag(:p, "Wants to connect", class: 'mt-0.5 text-xs text-gray-500 w-full') +
        content_tag(:div, class: "mt-1 flex") do
          link_to(accept_friend_request_path(@notif.id), method: :put, remote: :true, class: 'btn btn-xs btn-circle btn-ghost') do
            heroicon "check-circle", options: { class: "w-6 h-6 text-primary" }
          end +
          link_to(deny_friend_request_path(@notif.id), method: :delete, remote: :true, class: 'btn btn-xs btn-circle btn-ghost') do
            heroicon "x-circle", options: { class: "w-6 h-6 text-secondary" }
          end
        end
      end
    end
  end
end
