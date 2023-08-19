# frozen_string_literal: true

require 'rails_helper'

feature 'Login'do
  let(:user) { create(:user) }

  background do
    visit unauthenticated_root_path
  end

  context 'with valid credentials' do
    scenario 'logs in with email and password' do
      fill_in('user_email', with: user.email)
      fill_in('user_password', with: user.password)
      click_on('Log in')

      expect(page).to have_current_path('/')
      expect(page).to have_content('Signed in successfully')
    end

    scenario 'returns to login page after failed login' do
      fill_in('user_email', with: 'bad@email.com')
      fill_in('user_password', with: 'bad')
      click_on('Log in')

      expect(page).to have_current_path('/sign_in')
    end
  end

  context 'when using OAuth' do
    shared_examples 'log in with' do |provider|
      scenario "#{provider}" do
        mock_oauth_provider(provider)
        find("##{provider}").click

        expect(page).to have_current_path(authenticated_root_path)
        expect(page).to have_content("Successfully authenticated")
      end
    end

    it_can 'log in with', :github
    it_can 'log in with', :discord
  end
end
