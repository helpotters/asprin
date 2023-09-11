require "rails_helper"

feature "Sending a friend request" do
  scenario "when user sends to another person" do
    user = create(:user)
    potential_friend = create(:user, first_name: "New", last_name: "Person")
    sign_in user

    # Visit their profile page
    visit show_profile_path(potential_friend.id)
    click_on "Add Friend"

    expect(potential_friend.notifications.count).to eq(1)
  end
end
