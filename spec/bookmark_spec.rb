require 'bookmark'
require 'pg'

describe 'Bookmark' do
  describe '.show_bookmarks' do
    it 'returns all bookmarks' do

      Bookmark.add_bookmark('http://www.google.com')
      Bookmark.add_bookmark('http://www.instagram.com')
      Bookmark.add_bookmark('http://www.makersacademy.com')
      bookmarks = Bookmark.show_bookmarks

      expect(bookmarks).to include('http://www.google.com')
      expect(bookmarks).to include('http://www.instagram.com')
      expect(bookmarks).to include('http://www.makersacademy.com')
    end
  end
end

