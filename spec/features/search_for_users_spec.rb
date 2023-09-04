require "rails_helper"

feature "User Search Integration", js: true do
  it "displays search suggestions when typing in the search box" do
    user = create(:user)
    other_user = create(:user, first_name: "Yee")

    visit("/rails/view_components/search_form_component/default")

    fill_in "Search", with: "First"

    suggestions = find("#suggestions")
    expect(suggestions).to have_content(user.full_name)
    expect(suggestions).not_to have_content(other_user.full_name)
  end
end
