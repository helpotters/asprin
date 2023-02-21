# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Friends', type: :feature do
  let(:user) { create(:user) }

  before do
    login_as(user)
    visit '/'
  end
  xcontext 'See friends' do
    xit 'displays current friends' do
    end
    xit 'does not display a non-friend'
  end
  xcontext 'Send friend request'
  xcontext 'See friend requests'
end
