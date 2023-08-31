require "rails_helper"

RSpec.describe "User Search Integration", type: :feature, js: true do
  it "displays search suggestions when typing in the search box" do
    user = create(:user)
    other_user = create(:user, first_name: "Yee")

    visit("/rails/view_components/search_form_component/default")

    fill_in "Search", with: "First"

    suggestions = find("#suggestions")
    expect(suggestions).to have_content(user.full_name)
    expect(suggestions).not_to have_content(other_user.full_name)
  end

  xit "hides suggestions when clicking outside of the search box" do
    visit root_path

    fill_in "Search...", with: "John"
    # Click outside the search box to trigger hideSuggestions
    find("body").click

    expect(page).to have_selector("#suggestions", visible: false)
  end

  xit "renders search suggestions when Turbo Stream updates" do
    visit root_path

    fill_in "Search...", with: "J"
    # Wait for suggestions to appear after fetching
    expect(page).to have_selector("#suggestions", visible: true)

    suggestions = find("#suggestions")
    expect(suggestions).to have_content(user1.full_name)
    expect(suggestions).to have_content(user2.full_name)
  end
end
