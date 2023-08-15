# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Friends', type: :feature, js: :true do
  let(:user) { create(:user) }

  before do
    login_as(user)
    create(:friendship, user:).friend
    visit authenticated_root_path
  end
  context 'Friends List' do
    it 'displays current friends' do
      friend = user.friends.first
      expect(page).to have_content(friend.full_name)
    end
    it 'does not display a non-friend' do
      non_friend = create(:user, first_name: 'Bill', last_name: 'Bob')
      expect(page).to_not have_content(non_friend.full_name)
    end
  end
  context "Friend Request" do
    scenario 'user accepts friend request from notification' do
      user = create(:user)
      friend = create(:user, first_name: 'Mr', last_name: 'Friend')
      friend_request = create(:friend_request, user: friend, requested_friend: user)
      sign_in(user)
      visit authenticated_root_path
      # visit home feed


      click_button("Notifications")
      find("#accept").click

      expect(page).to have_content(friend.full_name)
    end
  end
end
