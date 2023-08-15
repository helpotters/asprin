# frozen_string_literal: true

class FriendRequestComponent < ViewComponent::Base
  include HeroiconHelper
  def initialize(friend_request:)
    @friend_request = friend_request
  end
end
