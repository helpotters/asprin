# frozen_string_literal: true

class PostFormComponentPreview < ViewComponent::Preview
  def initialize
    @user = FactoryBot.create(:user)
  end
  def default
    render(PostFormComponent.new(user: @user))
  end
end
