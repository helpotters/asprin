# frozen_string_literal: true

class FriendRequestComponent < ApplicationComponent
  renders_one :avatar, -> do
                AvatarComponent.new(src: @image, alt: "Request from #{@full_name}")
              end

  include HeroiconHelper

  def initialize(friend_request:)
    @friend_request = friend_request
    @user = friend_request.user
    @image = @user.image
    @full_name = @user.full_name
  end
end
