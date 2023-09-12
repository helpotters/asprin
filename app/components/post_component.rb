# frozen_string_literal: true

class PostComponent < ApplicationComponent
  include ApplicationHelper
  delegate :can?, :cannot?, to: :helpers

  def initialize(post:)
    @post = post
    @user = post.user
  end
end
