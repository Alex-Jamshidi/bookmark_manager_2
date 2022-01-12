# frozen_string_literal: true

feature 'Adding a bookmark' do
  scenario 'Can navigate to a new bookmark page via a button click' do
    visit('/')
    click_button 'Add Bookmark'
    expect(page).to have_content 'Add a new bookmark'
  end

  scenario 'An internet user can add a bookmark' do
    visit('/new_bookmark')
    fill_in :title, with: 'GitHub'
    fill_in :url, with: 'http://www.github.com'
    click_button 'Submit'
    expect(page).to have_content 'GitHub'
  end
end
