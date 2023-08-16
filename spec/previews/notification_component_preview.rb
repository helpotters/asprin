class NotificationComponentPreview < ViewComponent::Preview
  def initialize
    @notif = FactoryBot.create(:notification, :for_friend_request)
  end
  def with_default
    render NotificationComponent.new notification: @notif
  end
end
