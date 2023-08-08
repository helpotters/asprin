# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Login', type: :feature do
  let(:user) { create(:user) }

  before do
    visit unauthenticated_root_path
  end

  it 'logins with email and password' do
    fill_in('user_email', with: user.email)
    fill_in('user_password', with: user.password)
    click_on('Log in')
    expect(page.current_path).to eq('/')
    expect(page).to have_content('Signed in successfully')
  end
  it 'returns to login page after failed login' do
    fill_in('user_email', with: 'bad@email.com')
    fill_in('user_password', with: 'bad')

    click_on('Log in')
    expect(page.current_path).to eq('/sign_in')
  end
end
