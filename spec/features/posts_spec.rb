# spec/features/posts_spec.rb
require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  let(:user) { create(:user) }
  before(:each) do
    sign_in user
    visit authenticated_root_path
  end
  xscenario 'User creates a post and sees it appear with Turbo Stream' do
    fill_in 'What is on your mind?', with: 'Hello, world!'
    find('#post-button').click
    expect(page).to have_content('Hello, world!')
  end

  xscenario 'User edits a post and sees the updated content with Turbo Stream' do
    post = FactoryBot.create(:post, user:)
    visit authenticated_root_path
    within "#post_#{post.id}" do
      click_link 'Edit'
    end
    fill_in 'post_text', with: 'Updated Content'
    click_button 'Update Post'
    expect(page).to have_content('Updated Content')
  end

  xscenario 'User deletes a post and sees it disappear with Turbo Stream' do
    post = FactoryBot.create(:post, user:)
    visit authenticated_root_path
    within "#post_#{post.id}" do
      click_link 'Delete'
    end
    expect(page).not_to have_content('To be deleted')
  end
end
