# frozen_string_literal: true

class PostComponent < ViewComponent::Base
  def initialize(post:, user:)
    @post = post
    @user = user
  end

end
