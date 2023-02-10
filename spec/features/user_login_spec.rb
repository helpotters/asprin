# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Login', type: :feature do
  let(:user) { create(:user) }

  before do
    visit root_path
  end

  it 'logins with email and password' do
    expect(page.current_path).to eq('/sign_in')
    fill_in('Email', with: user.email)
    fill_in('Password', with: user.password)
    click_on('Log in')
    expect(page.current_path).to eq('/')
  end
  it 'returns to login page after failed login' do
    expect(page.current_path).to eq('/sign_in')
    fill_in('Email', with: 'bad@email.com')
    fill_in('Password', with: 'bad')

    click_on('Log in')
    expect(page.current_path).to eq('/sign_in')
  end
end
