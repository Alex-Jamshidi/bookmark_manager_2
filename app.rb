require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
    enable :sessions
    configure :development do
        register Sinatra::Reloader
    end


    # Routes
    get '/' do
        @bookmarks = Bookmark.show_bookmarks
      
    erb :index
    end

    
    

run! if app_file == $0

end