require "rails_helper"

feature "user sees friend list" do
  scenario "displays newly added friend" do
    user = create(:user)
    friend = create(:friendship, user: user).friend

    login_as(user)
    visit authenticated_root_path

    expect(page).to have_content(friend.full_name)
  end
  scenario "does not display a non-friend" do
    user = create(:user)
    non_friend = create(:user, first_name: "Bill", last_name: "Bob")


    login_as(user)
    visit authenticated_root_path

    expect(page).to_not have_content(non_friend.full_name)
  end
end
