# frozen_string_literal: true

require 'rails_helper'

feature 'User profile edit' do

  scenario 'user updates their profile' do
    user = create(:user)
    new_first_name = 'New First Name'
    new_last_name = 'New Last Name'

    sign_in user

    visit edit_profile_path

    fill_in 'user_first_name', with: new_first_name
    fill_in 'user_last_name', with: new_last_name

    click_button 'Save'

    user.reload
    expect(user.first_name).to eq(new_first_name)
    expect(user.last_name).to eq(new_last_name)

    expect(page).to have_content('Profile successfully updated!')
  end

  xscenario 'user provides invalid information' do
    sign_in user

    visit edit_user_registration_path

    fill_in 'user_email', with: 'invalid_email'

    click_button 'Update Profile'

    expect(page).to have_content('Profile update failed. Please check the errors.')
    expect(page).to have_css('.field_with_errors')
  end
end
