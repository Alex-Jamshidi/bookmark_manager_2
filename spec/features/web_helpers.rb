require 'spec_helper.rb'

def save_and_show
    if ENV['rspec'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
      result = connection.exec('SELECT * FROM bookmarks;')
      result.map { |bookmark| bookmark['url'] }
    end

    visit('/')
end