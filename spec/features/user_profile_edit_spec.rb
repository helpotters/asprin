# frozen_string_literal: true

require "rails_helper"

feature "Editing Profile:", js: true do
  scenario "when user updates their profile" do
    user = create(:user)
    new_first_name = "New First Name"
    new_last_name = "New Last Name"

    sign_in user

    visit edit_profile_path

    fill_in "user_first_name", with: new_first_name
    fill_in "user_last_name", with: new_last_name

    click_on "Save"

    user.reload
    expect(user.first_name).to eq(new_first_name)
    expect(user.last_name).to eq(new_last_name)

    expect(page).to have_content("Profile successfully updated!")
  end

  scenario "when user tries to visit another profile edit page" do
    user = create(:user, first_name: "First", last_name: "Last")
    other_user = create(:user, first_name: "Wrong", last_name: "Person")

    sign_in user

    visit edit_profile_path(other_user)

    expect(page).to have_content("First Last")
  end

  xscenario "when user provides invalid information" do
    user = create(:user)
    sign_in user

    visit edit_profile_path(user)
    fill_in "user_email", with: "invalid_email"
    click_button "Update"

    expect(page).to have_content("Profile update failed. Please check the errors.")
  end
end
