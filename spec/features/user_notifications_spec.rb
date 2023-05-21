# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User Notifications', type: :feature do
  let(:user) { create(:user) }
  let(:friend) { create(:user, first_name: 'Mr', last_name: 'Friend') }
  context 'notifications' do
    # friend is the requester
    let!(:friend_request) { create(:friend_request, user: friend, requested_friend: user) }

    it 'creating a new notification' do
      sign_in(user)
      # visit home feed
      within('.notifications') do
        expect(page).to have_content('New Request')
        expect(page).to have_content(friend.full_name)
      end
    end
    # update, destroy
  end
end
