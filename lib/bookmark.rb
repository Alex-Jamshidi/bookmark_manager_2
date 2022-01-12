# frozen_string_literal: true

require 'pg'

class Bookmark

  attr_reader :id, :title, :url

  def initialize(id, title, url)
    @id = id
    @title = title
    @url = url
  end
  
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
    result.map { |bookmark| self.new(bookmark['id'], bookmark['title'], bookmark['url']) }
  end

  def self.add_bookmark(title, url)
    connection = connect
    result = connection.exec("INSERT INTO bookmarks (title, url) VALUES ('#{title}', '#{url}') RETURNING id, url, title;")
    Bookmark.new(result[0]['id'], result[0]['title'], result[0]['url'])
    
  end
end
