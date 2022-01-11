require 'bookmark'
require 'pg'

describe 'Bookmark' do
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")
  connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.instagram.com');")
  connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
  result = connection.exec('SELECT * FROM bookmarks')
 

  describe '.show_bookmarks' do
    it 'returns all bookmarks' do
      # bookmarks = Bookmark.show_bookmarks
      bookmarks = result.map { |bookmark| bookmark['url'] }

      expect(bookmarks).to include('http://www.google.com')
      expect(bookmarks).to include('http://www.instagram.com')
      expect(bookmarks).to include('http://www.makersacademy.com')
    end
  end
end

