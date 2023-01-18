# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Home Page', type: :feature do
  before do
    visit root_path
  end

  it 'lets you sign up' do
    click_on('Sign up')

    fill_in('Email', with: 'test@email.com')
    fill_in('Enter password', with: 'password123')
    fill_in('Confirm password', with: 'password123')
    click_on('Submit')

    p page.current_path
    expect(page).to have_content('Bill Bob')
  end
end
