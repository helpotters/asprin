# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Friends', type: :feature do
  let(:user) { create(:user) }

  before do
    login_as(user)
    visit authenticated_root_path
  end
  context 'See friends' do
    it 'displays current friends' do
      friend = create(:friendship, user:).friend
      expect(user.friends.first).to eq(friend)
    end
    xit 'does not display a non-friend'
  end
  xcontext 'Send friend request'
  xcontext 'See friend requests'
end
