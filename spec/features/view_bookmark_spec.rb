require 'pg'

feature 'Viewing bookmark manager' do
 scenario 'visit web page' do
    Bookmark.add_bookmark('http://www.google.com')
    Bookmark.add_bookmark('http://www.instagram.com')
    Bookmark.add_bookmark('http://www.makersacademy.com')
    bookmarks = Bookmark.show_bookmarks
    visit('/')

    expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'http://www.instagram.com'
    expect(page).to have_content 'http://www.makersacademy.com'
  
 end
end