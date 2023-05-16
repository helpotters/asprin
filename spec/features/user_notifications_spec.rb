# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User Notifications', type: :feature do
  let(:user) { create(:user) }
  let(:friend) { create(:user, first_name: 'Mr', last_name: 'Friend') }
  context 'friend request' do
    let!(:friend_request) { create(:friend_request, user: friend, requested_friend: user) }
    let!(:notification) { create(:notification, :new, receipent: user) }

    it 'shows friend request' do
      sign_in(user)

      within('.notifications') do
        # TODO: Adjust content expectations
        expect(page).to have_content('New Request')
        expect(page).to have_content('Mr Friend')
      end
    end
  end
end
