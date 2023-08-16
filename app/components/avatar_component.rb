# frozen_string_literal: true

class AvatarComponent < ViewComponent::Base
  def initialize(user:, size: '10')
    @user = user
    @size = size
  end

  def user_image
    @user.image unless @user.image.nil?
  end

  def user_status
    @user.online? ? "online" : "offline"
  end

  def user_initials
    @user&.first_name[0]
  end
end
