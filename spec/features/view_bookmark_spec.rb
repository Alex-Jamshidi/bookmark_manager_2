require 'pg'

feature 'Viewing bookmark manager' do
 scenario 'visit web page' do
  connection = PG.connect(dbname: 'bookmark_manager_test')
    save_and_show

    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.instagram.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    visit('/')

    expect(page).to have_content 'google.com'
    expect(page).to have_content 'instagram.com'
    expect(page).to have_content 'makersacademy.com'
  
 end
end