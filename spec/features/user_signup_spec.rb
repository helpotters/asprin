# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Sign Up', type: :feature do
  let(:user) do
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
      find('#user_email').fill_in(with: user[:email])
      find('#user_password').fill_in(with: user[:password])
      find('#user_password_confirmation').fill_in(with: user[:password])
      find_button('Sign up').click
      expect(User.all.count).to eq(1)
      expect(page.current_path).to eq('/')
    end
    xit 'notifies user to confirm if they try logging in' do
    end
  end
  context 'when invalid' do
    it 'notifies of invalid email' do
      find('#user_email').fill_in(with: 'bad email')
      find('#user_password').fill_in(with: user[:password])
      find('#user_password_confirmation').fill_in(with: user[:password])
      find_button('Sign up').click
      expect(page).to have_content('is invalid')
    end
    it 'notifies non-matching passwords' do
      find('#user_email').fill_in(with: user[:email])
      find('#user_password').fill_in(with: user[:password])
      find('#user_password_confirmation').fill_in(with: 'Wrong')
      find_button('Sign up').click
      expect(page).to have_content("doesn't match Password")
    end
  end
  context 'when using oauth to sign up ' do
    before do
      mock_oauth_provider(:github)
      mock_oauth_provider(:discord)
    end

    after do
      OmniAuth.config.mock_auth[:github] = nil
      OmniAuth.config.mock_auth[:discord] = nil
    end

    it 'can sign up with github' do
      find('#github').click
      expect(User.all.count).to eq(1)
      expect(page.current_path).to eq('/')
      expect(page).to have_content('Successfully authenticated')
    end
    it 'can sign up with discord' do
      find('#discord').click
      expect(User.all.count).to eq(1)
      expect(page.current_path).to eq('/')
      expect(page).to have_content('Successfully authenticated')
    end
  end
end
