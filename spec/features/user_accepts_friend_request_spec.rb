# frozen_string_literal: true

require "rails_helper"

feature "user interacts with friend request", js: :true do
  scenario "user accepts friend request from notification" do
    user = create(:user)
    friend = create(:user, first_name: "Mr", last_name: "Friend")
    friend_request = create(:friend_request, user: friend, requested_friend: user)

    sign_in(user)
    visit authenticated_root_path
    # visit home feed

    click_on("Notifications")
    click_on("Accept Friend Request")

    expect(page).to have_content(friend.full_name)
  end
end
