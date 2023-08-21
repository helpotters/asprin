# frozen_string_literal: true

class FriendRequestComponent < ApplicationComponent
  include HeroiconHelper

  def initialize(friend_request:)
    @friend_request = friend_request
  end
end
