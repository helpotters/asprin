# frozen_string_literal: true

require 'rails_helper'

feature 'user interacts with', js: true do
  context 'new notifications' do
    scenario 'user has unread friend request' do
      user = create(:user)
      friend = create(:user, first_name: 'Mr', last_name: 'Friend')
      friend_request = create(:friend_request, user: friend, requested_friend: user)
      sign_in(user)
      visit authenticated_root_path
      # visit home feed

      # Click dropdown menu
      click_button("Notifications")
      within('#all_notifs') do
        expect(page).to have_content('Wants to connect')
        expect(page).to have_content(friend.full_name)
      end
    end
  end
end
