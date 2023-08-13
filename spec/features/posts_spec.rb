require 'rails_helper'

RSpec.feature 'Posts', type: :feature, js: :true do
  scenario 'User creates a post and sees it appear' do
    # Arrange
    user = create(:user)
    sign_in user
    visit authenticated_root_path
    post_content = 'Hello, world!'

    # Act
    fill_in 'What is on your mind?', with: post_content
    click_button("post_button")

    # Assert
    expect(page).to have_content(post_content)
  end

  scenario 'User edits a post and sees the updated content' do
    # Arrange
    user = create(:user)
    sign_in user
    # make post before visiting feed
    post = create(:post, user: user)
    visit authenticated_root_path
    updated_content = 'Updated Content'

    # Act
    within "#post_#{post.id}" do
      click_link 'Edit'
    end
    fill_in 'post_text', with: updated_content
    click_button 'Update'

    # Assert
    expect(page).to have_content(updated_content)
  end

  scenario 'User deletes a post and sees it disappear' do
    # Arrange
    user = create(:user)
    sign_in user
    # make post before visiting feed
    post = create(:post, user: user)
    visit authenticated_root_path

    # Act
    within "#post_#{post.id}" do
      click_link 'Delete'
    end

    # Assert
    expect(page).not_to have_content('To be deleted')
  end
end
