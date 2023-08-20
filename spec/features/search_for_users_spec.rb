require "rails_helper"

RSpec.xdescribe "User Search Integration", type: :system, js: :true, search: :true do
  it "displays search suggestions when typing in the search box" do
    user = FactoryBot.create(:user, :reindex)
    other_user = create(:user)
    User.search_index.refresh

    visit("/rails/view_components/search_form_component/default")
    prefix = page.find_field('Search')
    prefix.set ""
    prefix.send_keys %w[F i r s t]

    errors = page.driver.browser.manage.logs.get(:browser)
    if errors.present?
        message = errors.map(&:message).join("\n")
        puts message
    end
    expect(page).to have_selector("#suggestions", visible: true)
    suggestions = find("#suggestions")
    expect(suggestions).to have_content(user.full_name)
    expect(suggestions).not_to have_content(other_user.full_name)
  end

  it "hides suggestions when clicking outside of the search box" do
    visit root_path

    fill_in "Search...", with: "John"
    # Click outside the search box to trigger hideSuggestions
    find("body").click

    expect(page).to have_selector("#suggestions", visible: false)
  end

  it "renders search suggestions when Turbo Stream updates" do
    visit root_path

    fill_in "Search...", with: "J"
    # Wait for suggestions to appear after fetching
    expect(page).to have_selector("#suggestions", visible: true)

    suggestions = find("#suggestions")
    expect(suggestions).to have_content(user1.full_name)
    expect(suggestions).to have_content(user2.full_name)
  end
end
