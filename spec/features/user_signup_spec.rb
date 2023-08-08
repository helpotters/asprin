# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Sign Up', type: :feature do
  let(:user_attributes) do
    {
      email: 'tom@example.com',
      password: 'pw1234!'
    }
  end

  before do
    visit new_user_registration_path
  end

  context 'when valid' do
    it 'signs up new user' do
      fill_in('user_email', with: user_attributes[:email])
      fill_in('user_password', with: user_attributes[:password])
      fill_in('user_password_confirmation', with: user_attributes[:password])
      click_button('Sign up')

      expect(User.all.count).to eq(1)
      expect(page).to have_current_path('/')
    end

    xit 'notifies user to confirm if they try logging in' do
      fill_in('user_email', with: user_attributes[:email])
      fill_in('user_password', with: user_attributes[:password])
      fill_in('user_password_confirmation', with: user_attributes[:password])
      click_button('Sign up')

      visit new_user_session_path
      expect(page).to have_content('You have to confirm your email address before continuing')
    end
  end

  context 'when invalid' do
    it 'notifies of invalid email' do
      fill_in('user_email', with: 'bad email')
      fill_in('user_password', with: user_attributes[:password])
      fill_in('user_password_confirmation', with: user_attributes[:password])
      click_button('Sign up')

      expect(page).to have_content('is invalid')
    end

    it 'notifies non-matching passwords' do
      fill_in('user_email', with: user_attributes[:email])
      fill_in('user_password', with: user_attributes[:password])
      fill_in('user_password_confirmation', with: 'Wrong')
      click_button('Sign up')

      expect(page).to have_content("doesn't match Password")
    end
  end

  context 'when using OAuth to sign up' do
    before do
      mock_oauth_provider(:github)
      mock_oauth_provider(:discord)
    end

    after do
      OmniAuth.config.mock_auth[:github] = nil
      OmniAuth.config.mock_auth[:discord] = nil
    end

    shared_examples 'successful OAuth sign-up' do |provider|
      it "can sign up with #{provider}" do
        find("##{provider}").click

        expect(User.all.count).to eq(1)
        expect(page).to have_current_path('/')
        expect(page).to have_content('Successfully authenticated')
      end
    end

    it_behaves_like 'successful OAuth sign-up', :github
    it_behaves_like 'successful OAuth sign-up', :discord
  end
end
