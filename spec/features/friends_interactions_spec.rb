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
    xit 'does not display a non-friend'
  end
  xcontext 'Send friend request'
  xcontext 'See friend requests'
end
