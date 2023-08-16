
# frozen_string_literal: true

class PostComponentPreview < ViewComponent::Preview
  def initialize
    @user = FactoryBot.create(:user)
    @post= FactoryBot.create(:post, user: @user)
  end
  def default
    render(PostComponent.new(user: @user, post: @post))
  end
end
