# frozen_string_literal: true

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
    p 'Welcome to the bookmarks page.'
    @bookmarks = Bookmark.show_bookmarks
    erb :index
  end

  get '/new_bookmark' do
    p 'Heading over to new bookmarks page...'
    erb :new_bookmark
  end

  post '/' do
    Bookmark.add_bookmark(params[:url])
    p 'Adding bookmark to list and heading back there..'
    redirect '/'
  end

  # ßget '/new_bookmark' do

  run! if app_file == $PROGRAM_NAME
end
