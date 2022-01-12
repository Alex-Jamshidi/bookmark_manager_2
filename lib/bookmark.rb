# frozen_string_literal: true

require 'pg'

class Bookmark
  def self.connect
    if ENV['rspec'] == 'test'
      PG.connect(dbname: 'bookmark_manager_test')
    else
      PG.connect(dbname: 'bookmark_manager')
    end
  end

  def self.show_bookmarks
    connection = connect

    result = connection.exec('SELECT * FROM bookmarks;')
    result.map { |bookmark| bookmark['url'] }
  end

  def self.add_bookmark(url)
    connection = connect
    connection.exec("INSERT INTO bookmarks (url) VALUES ('#{url}');")
  end
end
