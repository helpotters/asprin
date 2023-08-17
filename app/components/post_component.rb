# frozen_string_literal: true

class PostComponent < ViewComponent::Base
  include ApplicationHelper
  def initialize(post:, user:)
    @post = post
    @user = user
  end
end
