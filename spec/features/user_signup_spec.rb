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
    visit '/sign_up'
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
  xcontext 'when invalid' do
    xit 'notifies user of invalid information' do
    end
  end
end
