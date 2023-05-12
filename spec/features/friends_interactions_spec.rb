# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Friends', type: :feature do
  let(:user) { create(:user) }

  before do
    login_as(user)
    create(:friendship, user:).friend
    visit authenticated_root_path
  end
  context 'See friends' do
    it 'displays current friends' do
      friend = user.friends.first
      expect(page).to have_content(friend.full_name)
    end
    it 'does not display a non-friend' do
      non_friend = create(:user, first_name: 'Bill', last_name: 'Bob')
      expect(page).to_not have_content(non_friend.full_name)
    end
  end
  xcontext 'Send friend request'
  xcontext 'See friend requests'
end
