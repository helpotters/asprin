# frozen_string_literal: true

class PostComponent < ApplicationComponent
  include ApplicationHelper

  def initialize(post:)
    @post = post
    @user = post.user
  end
end
