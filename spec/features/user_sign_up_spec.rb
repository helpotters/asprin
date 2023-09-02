# frozen_string_literal: true

require "rails_helper"

feature "user signs up", js: true do
  background do
    visit new_user_registration_path
  end

  context "with valid credentials" do
    scenario "signs up new user" do
      fill_in("user_first_name", with: "Bill")
      fill_in("user_last_name", with: "Test")
      fill_in("user_email", with: "test@email.com")
      fill_in("user_password", with: "pw123456")
      fill_in("user_password_confirmation", with: "pw123456")

      click_on("Sign up") # Can't have 'Sign up' page link in navbar

      expect(page).to have_current_path(authenticated_root_path)
      expect(page).to have_content("successfully")
    end

    xscenario "notifies user to confirm if they try logging in" do
      fill_in("user_email", with: "test@email.com")
      fill_in("user_password", with: "pw123456")
      fill_in("user_password_confirmation", with: "pw123456")

      click_on("Sign up")

      visit new_user_session_path
      expect(page).to have_content("You have to confirm your email address before continuing")
    end
  end

  context "when invalid" do
    scenario "notifies of invalid email" do
      fill_in("user_email", with: "bad email") # Invalid

      fill_in("user_password", with: "pw123456")
      fill_in("user_password_confirmation", with: "pw123456")

      click_on("Sign up")

      expect(page).to_not have_current_path(authenticated_root_path, url: true)
      expect(page).to have_content("is invalid")
    end

    scenario "notifies non-matching passwords" do
      fill_in("user_email", with: "test@email.com")
      fill_in("user_password", with: "pw123456")
      fill_in("user_password_confirmation", with: "Wrong")

      click_on("Sign up")

      expect(page).to_not have_current_path(authenticated_root_path, url: true)
      expect(page).to have_content("doesn't match Password")
    end
  end

  context "when using OAuth" do
    shared_examples "sign up with" do |provider|
      scenario "#{provider}" do
        mock_oauth_provider(provider)
        find("##{provider}").click

        expect(page).to have_current_path(authenticated_root_path)
        expect(page).to have_content("Successfully authenticated")
      end
    end

    it_can "sign up with", :github
    it_can "sign up with", :discord
  end
end
