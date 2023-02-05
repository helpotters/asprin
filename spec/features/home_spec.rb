# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Home', type: :feature do
  let(:user) { create(:user) }
  before do
    # user is confirmed
    login_as(user)
    visit root_path
  end
  context 'Posting' do
    it 'lets user post text to their feed' do
      post_info = 'Feeling yeeterinos'
      find('#post_form').fill_in(with: post_info)
      find_button('Post').click

      expect(page).to have_content(post_info)
    end
  end
end
