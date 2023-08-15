# frozen_string_literal: true

class AvatarComponent < ViewComponent::Base
  def initialize(user:, size: '10')
    @size = size
    @user = user
    @online = user.online? ? "online" : "offline"
  end
end
