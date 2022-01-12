# frozen_string_literal: true

require 'bookmark'
require 'pg'

describe 'Bookmark' do
  describe '.show_bookmarks' do
    it 'returns all bookmarks' do
      bookmark = Bookmark.add_bookmark('Google', 'http://www.google.com')
      Bookmark.add_bookmark('Instagram', 'http://www.instagram.com')
      Bookmark.add_bookmark('Makers', 'http://www.makersacademy.com')
      bookmarks = Bookmark.show_bookmarks

      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Google'
      expect(bookmarks.first.url).to eq 'http://www.google.com'
    end
  end

  require 'database_helpers'

  describe '.create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.add_bookmark('Test Bookmark', 'http://www.example.org')
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Test Bookmark'
      expect(bookmark.url).to eq 'http://www.example.org'
    end
  end
end
