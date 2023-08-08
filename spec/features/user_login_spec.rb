# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Login', type: :feature do
  let(:user) { create(:user) }

  before do
    visit unauthenticated_root_path
  end

  describe 'regular login' do
    it 'logs in with email and password' do
      fill_in('user_email', with: user.email)
      fill_in('user_password', with: user.password)
      click_on('Log in')

      expect(page).to have_current_path('/')
      expect(page).to have_content('Signed in successfully')
    end

    it 'returns to login page after failed login' do
      fill_in('user_email', with: 'bad@email.com')
      fill_in('user_password', with: 'bad')
      click_on('Log in')

      expect(page).to have_current_path('/sign_in')
    end
  end

  describe 'OAuth login' do
    before do
      mock_oauth_provider(:github)
      mock_oauth_provider(:discord)
    end

    after do
      OmniAuth.config.mock_auth[:github] = nil
      OmniAuth.config.mock_auth[:discord] = nil
    end

    shared_examples 'successful OAuth login' do |provider|
      it "can login with #{provider}" do
        find("##{provider}").click

        expect(User.all.count).to eq(1)
        expect(page).to have_current_path('/')
        expect(page).to have_content('Successfully authenticated')
      end
    end

    it_behaves_like 'successful OAuth login', :github
    it_behaves_like 'successful OAuth login', :discord
  end
end
