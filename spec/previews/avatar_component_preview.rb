# frozen_string_literal: true

class AvatarComponentPreview < ViewComponent::Preview
  def initialize
    @user = FactoryBot.create(:user)
  end
  def default
    render(AvatarComponent.new(user: @user, size: "8"))
  end
end
